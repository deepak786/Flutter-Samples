import 'package:flutter/material.dart';

const radius = 10.0;
const highLightColor = Colors.grey;
const imageSize = 40.0;
const colorBase = Color.fromARGB(255, 119, 158, 154);

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  TextEditingController nameCont = new TextEditingController();
  TextEditingController emailCont = new TextEditingController();
  TextEditingController passCont = new TextEditingController();

  void clickedOnCross() {}

  void facebook() {}

  void linkedIn() {}

  void google() {}

  void twitter() {}

  void signup() {}

  void tc() {}

  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(10.0),
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Align(alignment: Alignment.topRight, child: CloseButton()),
                  Text(
                    "Sign Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  Text(
                    "Please sign up with an existing account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset(
                          "images/twitter.png",
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.cover,
                          color: Color.fromARGB(255, 29, 161, 242),
                        ),
                        onPressed: twitter,
                      ),
                      IconButton(
                        icon: Image.asset(
                          "images/google.png",
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.cover,
                          color: Color.fromARGB(255, 219, 68, 55),
                        ),
                        onPressed: google,
                      ),
                      IconButton(
                        icon: Image.asset(
                          "images/facebook.png",
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.cover,
                          color: Color.fromARGB(255, 59, 89, 152),
                        ),
                        onPressed: facebook,
                      ),
                      IconButton(
                        icon: Image.asset(
                          "images/linkedin.png",
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.fitHeight,
                          color: Color.fromARGB(255, 0, 119, 181),
                        ),
                        onPressed: linkedIn,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Text(
                    "or create a new one",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: nameCont,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(hintText: "Name"),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: emailCont,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(hintText: "Email"),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: passCont,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Password"),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 20.0, right: 10.0, bottom: 20.0),
                    child: RaisedButton(
                      onPressed: signup,
                      color: colorBase,
                      child: Text(
                        "SIGN UP",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  Text(
                    "By signing up, you agree to the",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      elevation: 0.0,
                      highlightElevation: 0.0,
                      color: Colors.transparent,
                      onPressed: tc,
                      child: Text(
                        "terms and conditions",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: colorBase,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 0.5,
              color: Colors.grey,
            )
            ,Container(
              color: Colors.white,
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Already registered?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: RaisedButton(
                            color: Colors.white,
                            elevation: 0.0,
                            highlightElevation: 0.0,
                            onPressed: login,
                            highlightColor: highLightColor,
                            child: Text(
                              "LOG IN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: colorBase,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ));
  }
}
