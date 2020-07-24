import 'package:flutter/material.dart';

class ProgressBarClipper extends CustomClipper<Path> {
  int steps;
  ProgressBarClipper(this.steps);

  int getSteps() => steps;

  @override
  Path getClip(Size size) {
    return getStepPath(size.width, size.height, steps.toDouble());
  }

  Path getOneStepPath(
      double x, double y, bool endStep, bool startStep, double r) {
    double radius = r;

    return Path()
      ..moveTo(startStep ? 0 + radius : 0, y / 4)
      ..lineTo(endStep ? x - radius : x, y / 4)
      ..lineTo(endStep ? x - radius : x, 3 * y / 4)
      ..lineTo(startStep ? 0 + radius : 0, 3 * y / 4)
      ..lineTo(startStep ? 0 + radius : 0, y / 4)
      ..addOval(
          Rect.fromCircle(center: Offset(x - radius, y / 2), radius: radius));
  }

  Path getStepPath(double x, double y, double steps) {
    double stepX = x / steps;
    double radius = y / 2;
    Path path = new Path();
    for (int i = 0; i < steps; i++) {
      double offsetX = stepX * i;
      if (i == (steps-1)) {
        // Now the endStep will be added
        path.addPath(
            getOneStepPath(stepX, y, true, false, radius), Offset(offsetX, 0));
        // The first oval will be added
        /* path.addOval(
            Rect.fromCircle(center: Offset(0 + radius, y / 2), radius: radius)); */
      } else {
        path.addPath(
            getOneStepPath(stepX, y, false, false, radius), Offset(offsetX, 0));
      }
    }
    return path;
  }

  @override
  bool shouldReclip(ProgressBarClipper oldClipper) {
    return oldClipper.steps != steps;
  }
}
