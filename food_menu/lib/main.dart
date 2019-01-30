import 'package:flutter/material.dart';

import 'menu_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.yellow,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("F&B"),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "COMBOS",
                ),
                Tab(
                  text: "DRINKS",
                ),
                Tab(
                  text: "CREPES",
                ),
              ],
            ),
          ),
          backgroundColor: Colors.black,
          body: TabBarView(children: [
            MenuList(),
            MenuList(),
            MenuList(),
          ]),
        ),
      ),
    );
  }
}
