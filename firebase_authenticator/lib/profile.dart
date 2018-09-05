import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'diagonal_clipper.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: FutureBuilder(
          future: getCurrentUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              FirebaseUser user = snapshot.data;
              return Container(
                margin: EdgeInsets.all(20.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 100.0),
                      child: ClipPath(
                        clipper: DiagonalClipper(100.0),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 120.0),
                              ),
                              Center(
                                child: Text(
                                  user.displayName,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                              ),
                              Center(
                                child: Text(
                                  user.email,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: 100.0),
                      child: Image.network(
                        user.photoUrl == null || user.photoUrl.isEmpty
                            ? "https://www.cloudninefertility.com/wp-content/uploads/2017/12/User-dummy-300x300.png"
                            : user.photoUrl,
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text("No current user found"),
              );
            }
          },
        ),
      ),
    );
  }
}

Future<FirebaseUser> getCurrentUser() async {
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  return user;
}
