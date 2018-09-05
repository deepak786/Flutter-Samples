import 'package:flutter/material.dart';

class DiagonalClipper extends CustomClipper<Path> {
  double cutLength = 100.0;

  DiagonalClipper(this.cutLength);

  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, cutLength);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
