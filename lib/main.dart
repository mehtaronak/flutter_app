import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/thirdscreen.dart';
import 'secondscreen.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Ronak Flutter App',
    theme: new ThemeData(
      primarySwatch: Colors.blue,
      backgroundColor: Colors.grey,
    ),
    home: new FirstScreen(),
    routes: <String, WidgetBuilder>{
      '/SecondScreen': (BuildContext context) => new SecondScreen(),
      '/ThirdScreen': (BuildContext context) => new ThirdScreen(),
    },
  ));
}

class FirstScreen extends StatefulWidget {
  @override
  FirstScreenState createState() => new FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 5);
    print("Hiiii");
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushNamed('/SecondScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset('images/thank_you.png'),
      ),
    );
  }
}

//class FirstScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext ctxt) {
//    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text("Multi Page Application Page-1"),
//        ),
//        body: new Container(
//          child: new Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              new RaisedButton(
//                onPressed: () {
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
//}
