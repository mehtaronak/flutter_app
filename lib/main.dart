import 'dart:async';

import 'package:flutter/material.dart';

import 'login.dart';
import 'secondscreen.dart';
import 'thirdscreen.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Ronak Flutter App',
    theme: new ThemeData(
      primarySwatch: Colors.blue,
      backgroundColor: Colors.grey,
    ),
    home: new FirstScreen(),
    routes: <String, WidgetBuilder>{
    //  '/SecondScreen': (BuildContext context) => new SecondScreen("",""),
      '/ThirdScreen': (BuildContext context) => new ThirdScreen(),
      '/LoginScreen': (BuildContext context) => new LoginScreen(),
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
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/LoginScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueAccent,
      body: new Center(
        child: new Image.asset('images/thank_you.png'),
      ),
    );
  }
}
