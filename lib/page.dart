import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'contact.dart';

class ContactTab extends StatelessWidget {
  ContactTab();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        body: new Container(
          child: new FutureBuilder<List<Contact>>(
            future: fetchUsersFromGitHub(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(snapshot.data[index].name,
                                style:
                                    new TextStyle(fontWeight: FontWeight.bold)),
                            new Divider()
                          ]);
                    });
              } else if (snapshot.hasError) {
                return new Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return new CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Future<List<Contact>> fetchUsersFromGitHub() async {
    final response = await http.get('https://api.androidhive.info/contacts/');
    Map<String, dynamic> responseJson = json.decode(response.body.toString());
    return responseJson['contacts'];
  }
}
