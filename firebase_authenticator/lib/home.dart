import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'diagonal_clipper.dart';
import 'profile.dart';

GoogleSignIn googleSignIn = new GoogleSignIn();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: new Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(80.0),
              child: Center(
                child: Text(
                  "Authenticator",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: ClipPath(
                clipper: DiagonalClipper(100.0),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 100.0),
                      ),
                      Center(
                        child: Text(
                          "Continue with",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 20.0, top: 20.0, bottom: 10.0, right: 20.0),
                        child: FlatButton(
                          color: Colors.blue.shade900,
                          onPressed: () => facebook(context),
                          child: Text(
                            "Facebook",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 20.0, top: 10.0, bottom: 20.0, right: 20.0),
                        child: FlatButton(
                          color: Colors.red.shade400,
                          onPressed: () => google(context),
                          child: Text(
                            "Google",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// login with facebook
  void facebook(context) async {
    FacebookLogin facebookSignIn = new FacebookLogin();
    final FacebookLoginResult result =
        await facebookSignIn.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithFacebook(accessToken: accessToken.token);
        goToProfile(context);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  /// login with google
  void google(context) async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    FirebaseUser user = await FirebaseAuth.instance.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    goToProfile(context);
  }

  /// goto user profile screen
  void goToProfile(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Profile();
    }));
  }
}
