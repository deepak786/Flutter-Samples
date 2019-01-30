import 'package:flutter/material.dart';
import 'background_clipper.dart';

class Toolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BackgroundClipper(),
      child: Container(
        padding: EdgeInsets.only(bottom: 2.0),
        color: Colors.grey[350],
        child: ClipPath(
          clipper: BackgroundClipper(),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.grey[350],
                    size: 30,
                  ),
                  Image.asset(
                    "images/logo.png",
                    width: 30.0,
                    height: 30.0,
                  ),
                  Icon(
                    Icons.menu,
                    color: Colors.grey[350],
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
