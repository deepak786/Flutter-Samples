import 'package:flutter/material.dart';

class OfferClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    print("${size.width}-----${size.height}");

    double defaultLineHt = 8.0;
    double defahltRadius = 30.0;

    int totalSteps = (size.height / defaultLineHt).floor();
    for (var i = 1; i <= totalSteps; i++) {
      double step = (size.height / totalSteps) * i;
      if (i % 2 != 0) {
        // draw line
        path.lineTo(0.0, step);
      } else {
        // draw curve
        double step2 = (size.height / totalSteps) * (i + 1);
        var firstControlPoint = Offset(defahltRadius, (step + step2) / 2);
        var firstPoint = Offset(0.0, step2);
        path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
            firstPoint.dx, firstPoint.dy);
      }
    }

    path.lineTo(size.width, size.height);

    for (var i = 1; i <= totalSteps; i++) {
      double step = size.height - (size.height / totalSteps) * i;
      if (i % 2 != 0) {
        // draw line
        path.lineTo(size.width, step);
      } else {
        // draw curve
        double step2 = size.height - (size.height / totalSteps) * (i + 1);
        var firstControlPoint =
        Offset(size.width - defahltRadius, (step + step2) / 2);
        var firstPoint = Offset(size.width, step2);
        path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
            firstPoint.dx, firstPoint.dy);
      }
    }
    path.lineTo(0.0, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
