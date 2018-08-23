import 'dart:math';

import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BMIState();
  }
}

class BMIState extends State<BMI> {
  TextEditingController age = new TextEditingController();
  TextEditingController weight = new TextEditingController();
  TextEditingController height = new TextEditingController();

  String bmi = "";
  String bmiStatus = "";

  void submit() {
    String age = this.age.text;
    String height = this.height.text;
    String weight = this.weight.text;

    if (height.isNotEmpty && weight.isNotEmpty && age.isNotEmpty) {
      setState(() {
        double bmiValue =
            (((double.parse(weight)) / (pow(double.parse(height) * 12, 2))) *
                703);
        if (bmiValue <= 18.5) {
          bmiStatus = "Underweight";
        } else if (bmiValue > 18.5 && bmiValue <= 24.9) {
          bmiStatus = "Normal weight";
        } else if (bmiValue >= 25 && bmiValue <= 29.9) {
          bmiStatus = "Overweight";
        } else {
          bmiStatus = "Obesity";
        }

        bmi = bmiValue.toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          "BMI",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Center(
            child: Image.asset(
              "images/logo.png",
              height: 100.0,
              width: 100.0,
              alignment: Alignment.center,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            color: Colors.black26,
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: age,
                  decoration: InputDecoration(
                      labelText: "Age",
                      hintText: "Age",
                      icon: Icon(
                        Icons.account_box,
                      )),
                ),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: height,
                  decoration: InputDecoration(
                      labelText: "Height in feet",
                      hintText: "Height in feet",
                      icon: Icon(
                        Icons.account_box,
                      )),
                ),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: weight,
                  decoration: InputDecoration(
                      labelText: "Weight (lbs)",
                      hintText: "Weight (lbs)",
                      icon: Icon(
                        Icons.account_box,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                ),
                RaisedButton(
                  onPressed: submit,
                  color: Colors.pinkAccent,
                  textColor: Colors.white,
                  child: Text("Calculate"),
                ),
              ],
            ),
          ),
          Text(
            bmi.isNotEmpty ? "Your BMI: " + bmi : "",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(padding: EdgeInsets.all(10.0)),
          Text(
            bmiStatus.isNotEmpty ? bmiStatus : "",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.pinkAccent,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
