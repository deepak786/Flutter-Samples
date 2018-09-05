import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Firebase Authenticator',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Color(0xffF9F9F9)
      ),
      home: Home(),
    );
  }
}
