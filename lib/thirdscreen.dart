import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  ThirdScreen();

  @override
  Widget build(BuildContext ctxt) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: new AppBar(
          bottom: TabBar(tabs: [
            Tab(
              icon: new Icon(Icons.home),
              text: "Tab 1",
            ),
            Tab(
              icon: new Icon(Icons.perm_identity),
              text: "Tab 2",
            ),
            Tab(
              icon: new Icon(Icons.settings),
              text: "Tab 3",
            ),
          ]),
          title: new Text("Welcome to the Third Page"),
        ),
        body: new TabBarView(
          children: <Widget>[
            new Text("Tab 1"),
            new Text("Tab 2"),
            new Text("Tab 3"),
          ],
        ),
      ),
    );

//    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text("Welcome to the Third Page"),
//        ),
//        body: new Container(
//          child: new Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              new RaisedButton(
//                onPressed: () {
//                  Scaffold.of(ctxt).showSnackBar(new SnackBar(content: new Text("Hi This is the SnackBAR")));
//                  Navigator.push(
//                      ctxt,
//                      MaterialPageRoute(
//                          builder: (ctxt) =>
//                              SecondScreen(title: 'Flutter Demo Home Page')));
//                },
//                child: Text("Raised Button"),
//              ),
//            ],
//          ),
//        ));
//  }
  }

  @override
  State<StatefulWidget> createState() {}
}
