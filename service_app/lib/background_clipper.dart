import 'package:flutter/material.dart';

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    print("${size.width}-----${size.height}");

    double heightClipped = size.height * (3 / 4);

    path.lineTo(0.0, heightClipped);

    var firstControlPoint = new Offset(size.width / 2, heightClipped + 30);
    var firstEndPoint = new Offset(size.width, heightClipped);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, 0.0);

    path.lineTo(0.0, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
