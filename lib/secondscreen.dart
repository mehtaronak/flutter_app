import 'package:flutter/material.dart';
import 'package:flutter_app/thirdscreen.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen();

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
              accountName: new Text("Ronak Mehta"),
              accountEmail: new Text("test@gmail.com"),
              currentAccountPicture: new Image.asset('images/user.png'),
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
                Navigator.of(context).pushNamed('/ThirdScreen');
              },
            ),
            new ListTile(
              leading: const Icon(Icons.settings),
              title: new Text("Item 2"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctxt) => ThirdScreen()));
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
