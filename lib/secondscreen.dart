import 'package:flutter/material.dart';
import 'package:flutter_app/thirdscreen.dart';
import 'login.dart';

class SecondScreen extends StatelessWidget {

  String emilID,name;
  SecondScreen(String emilID,String name){
    this.emilID = emilID;
    this.name = name;
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
