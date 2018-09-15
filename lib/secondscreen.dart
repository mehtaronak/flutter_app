import 'package:flutter/material.dart';
import 'package:flutter_app/thirdscreen.dart';

const String _AccountAbbr = 'RM';

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
                  backgroundColor: Colors.brown, child: new Text(_AccountAbbr)),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: () {
                    openOtherAccount(context);
                  },
                  child: Semantics(
                    label: "Switch to testing@test.com",
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
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Sorry"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text("OKAY"))
            ],
          );
        });
  }
}
