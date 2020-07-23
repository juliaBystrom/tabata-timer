import 'package:flutter/material.dart';


class TriangleClipper extends CustomClipper<Path> {
  bool pointUp;
  TriangleClipper(this.pointUp);

  @override
  Path getClip(Size size) {
    return getTrianglePath(size.width, size.height);
  }

  Path getTrianglePath(double x, double y) {
    if (pointUp) {
      return Path()
        ..moveTo(0, y)
        ..lineTo(x / 2, 0)
        ..lineTo(x, y)
        ..lineTo(0, y);
    } else {
      return Path()
        ..moveTo(0, 0)
        ..lineTo(x / 2, y)
        ..lineTo(x, 0)
        ..lineTo(0, 0);
    }
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}