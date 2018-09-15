import 'package:flutter/material.dart';
import 'package:flutter_app/thirdscreen.dart';

class SecondScreen extends StatelessWidget {
  String emilID, name, userImage;

  SecondScreen(String emilID, String name, String userImage) {
    this.emilID = emilID;
    this.name = name;
    this.userImage = userImage;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("This is a TITLE"),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(name),
              accountEmail: new Text(emilID),
              currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage(userImage),
                  child: new Text("")),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: () {
                    openOtherAccount(context);
                  },
                  child: Semantics(
                    label: "Switch to testing@test.com",
                    child: new CircleAvatar(
                      backgroundColor: Colors.brown,
                      child: new Text('RM'),
                    ),
                  ),
                )
              ],
              decoration: new BoxDecoration(color: Colors.blueAccent),
            ),
            new ListTile(
              leading: const Icon(Icons.home),
              title: new Text("Item 1"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/ThirdScreen');
              },
            ),
            new ListTile(
              leading: const Icon(Icons.settings),
              title: new Text("Go to 2nd Screen"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctxt) => ThirdScreen()));
              },
            ),
            new ListTile(
              leading: const Icon(Icons.settings),
              title: new Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void openOtherAccount(BuildContext context) {
    Navigator.of(context).pop();
    showDialog<Null>(
      context: context,
      child: new AlertDialog(
        title: const Text('Account switching not implemented.'),
        actions: <Widget>[
          new FlatButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
