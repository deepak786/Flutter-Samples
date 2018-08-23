import 'package:flutter/material.dart';
import './ui/add_money.dart';

void main() => runApp(new LetItRain());

class LetItRain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Let It Rain",
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: AddMoney(),
      ),
    );
  }
}
