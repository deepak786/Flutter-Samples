import 'package:flutter/material.dart';

class AddMoney extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddMoneyState();
  }
}

class AddMoneyState extends State<AddMoney> {
  var money = 0;
  Color color;

  void addMoney() {
    money = money + 200;
    if (money >= 2000)
      color = Colors.lightBlue;
    else if (money < 2000 && money > 500)
      color = Colors.green;
    else
      color = Colors.black;
    setState(() {
      money;
      color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          margin:
              EdgeInsets.only(left: 15.0, top: 30.0, right: 15.0, bottom: 15.0),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
                left: 20.0, top: 50.0, right: 20.0, bottom: 50.0),
            child: Center(
              child: Text(
                "\$ $money",
                style: TextStyle(
                    color: color, fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
              child: Container(
            child: RaisedButton(
              onPressed: addMoney,
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Add Money",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.green,
            ),
          )),
        )
      ],
    );
  }
}
