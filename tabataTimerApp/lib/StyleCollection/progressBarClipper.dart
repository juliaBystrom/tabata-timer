import 'package:flutter/material.dart';

class ProgressBarClipper extends CustomClipper<Path> {
  int steps;

  ProgressBarClipper(this.steps);

  int getSteps() => steps;

  @override
  Path getClip(Size size) {
    return getStepPath(size.width, size.height, steps.toDouble());
  }

  Path getOneStepPath(double x, double y, bool endStep, bool startStep,
      double r, double halfHeight) {
    double radius = r;
    double startX = startStep ? 0 + radius : 0;
    double endX = endStep ? x - halfHeight : x;

    double lowerY = y / 2 - halfHeight;
    double upperY = y / 2 + halfHeight;

    return Path()
      ..moveTo(startX, lowerY)
      ..lineTo(endX, lowerY)
      ..lineTo(endX, upperY)
      ..lineTo(startX, upperY)
      ..lineTo(startX, lowerY)
      ..addOval(Rect.fromCircle(center: Offset(radius, y / 2), radius: radius));
  }

  Path getStepPath(double x, double y, double steps) {
    // The width between circles should be the same as the the width of the circle (2 radius)
    // Therefore: radius = x / (4 * steps)
    // However when there are many Tabatas the circles shuld be bigger 
    // Therefore: radius = x / (3 * steps)

    double radius = x / (3 * steps);
    if (radius * 2 > y) {
      radius = x / (4 * steps);
    }
    double stepX = x / steps;

    double halfLineHeight = (y * (1 / steps)) / 2;


    Path path = new Path();
    for (int i = 0; i < steps; i++) {
      double offsetX = stepX * i;
      if (i == 0) {
        // Here the startStep will be added
        path.addPath(
            getOneStepPath(
                stepX, y, false, true, radius, halfLineHeight),
            Offset(offsetX, 0));
      } else if (i == (steps - 1)) {
        // Now the endStep will be added. OBS does nothing different now.
        path.addPath(
            getOneStepPath(
                stepX, y, true, false, radius, halfLineHeight),
            Offset(offsetX, 0));
        // Adds the rounded edge at the end
        path.addOval(Rect.fromCircle(
            center: Offset(x - halfLineHeight, y / 2), radius: halfLineHeight));
        // The first oval will be added
        /* path.addOval(
            Rect.fromCircle(center: Offset(0 + radius, y / 2), radius: radius)); */
      } else {
        path.addPath(
            getOneStepPath(
                stepX, y, false, false, radius, halfLineHeight),
            Offset(offsetX, 0));
      }
    }

    return path;
  }

  @override
  bool shouldReclip(ProgressBarClipper oldClipper) {
    return oldClipper.steps != steps;
  }
}
