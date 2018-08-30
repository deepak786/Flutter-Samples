import 'package:flutter/material.dart';

class CustomPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var width = size.width;
    var height = size.height;

    print(width.toString()+"------"+height.toString());
    Path path = new Path();
    path.lineTo(0.0, height);
    path.lineTo(width/10, height);
    path.lineTo(width/5, height - height/12);
    path.lineTo((width*8)/10, height - height/12);
    path.lineTo((width*9)/10, height);
    path.lineTo(width, height);
    path.lineTo(width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
