import 'dart:async';
import 'dart:convert' show json;
import 'secondscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import "package:http/http.dart" as http;

GoogleSignIn _googleSignIn = new GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  GoogleSignInAccount _currentUser;
  String _contactText;

  void navigationPage() {
    //Navigator.of(context).pushNamed('/SecondScreen');
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new SecondScreen(_currentUser.displayName,_currentUser.email,_currentUser.photoUrl)));
  }

  @override
  void initState() {
    super.initState();
    //  startTime();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact();
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<Null> _handleGetContact() async {
    setState(() {
      _contactText = "Loading contact info...";
    });
    final http.Response response = await http.get(
      'https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names',
      headers: await _currentUser.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = "I see you know $namedContact!";
      } else {
        _contactText = "No contacts to display.";
      }
    });
  }

  String _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic> connections = data['connections'];
    final Map<String, dynamic> contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic> name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  Future<Null> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<Null> _handleSignOut() async {
    _googleSignIn.disconnect();
  }

  Widget _buildBody() {
    if (_currentUser != null) {
      return new Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new ListTile(
            leading: new GoogleUserCircleAvatar(
              identity: _currentUser,
            ),
            title: new Text(_currentUser.displayName),
            subtitle: new Text(_currentUser.email),
          ),
          const Text("Signed in successfully."),
          new Text(_contactText),
          new RaisedButton(
            child: const Text('SIGN OUT'),
            onPressed: _handleSignOut,
          ),
          new RaisedButton(
            child: const Text('REFRESH'),
            onPressed: _handleGetContact,
          ),
          new RaisedButton(
            child: const Text('Next Screen'),
            onPressed: navigationPage,
          ),
        ],
      );
    } else {
      return new Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text("You are not currently signed in."),
          new RaisedButton(
            child: const Text('SIGN IN'),
            onPressed: _handleSignIn,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: _buildBody(),
      ),
    );
  }
}
