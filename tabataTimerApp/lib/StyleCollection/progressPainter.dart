import 'package:flutter/material.dart';
import 'progressBarClipper.dart';

class ProgressPainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;
  int steps;

  // ProgressBarClipper progC = new ProgressBarClipper(5);

  ProgressPainter(this.steps,
      {this.strokeColor = Colors.black,
      this.strokeWidth = 3,
      this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    /* canvas.drawPath(
        getStepPath(size.width, size.height, steps.toDouble()), paint); */

    draw(size.width, size.height, steps.toDouble(), paint, canvas);

    // canvas.drawPath(getTrianglePath(size.width, size.height), outline);
  }

  void draw(double x, double y, double steps, Paint paint, Canvas canvas) {
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
        canvas.drawPath(
            getOneStepPath(stepX, y, false, true, radius, halfLineHeight),
            paint);

        /*path.addPath(
            getOneStepPath(stepX, y, false, true, radius, halfLineHeight),
            Offset(offsetX, 0));*/
      } else if (i == (steps - 1)) {
        // Now the endStep will be added. OBS does nothing different now.
        canvas.drawPath(
            getOneStepPath(stepX, y, true, false, radius, halfLineHeight),
            paint);
        /*path.addPath(
            getOneStepPath(stepX, y, true, false, radius, halfLineHeight),
            Offset(offsetX, 0));*/
        // Adds the rounded edge at the end
        Path circleP = new Path();
        circleP.addOval(Rect.fromCircle(
            center: Offset(x - halfLineHeight, y / 2), radius: halfLineHeight));
        canvas.drawPath(circleP, paint);
        /*path.addOval(Rect.fromCircle(
            center: Offset(x - halfLineHeight, y / 2), radius: halfLineHeight));*/
      } else {
        canvas.drawPath(
            getOneStepPath(stepX, y, false, false, radius, halfLineHeight),
            paint);

        /*path.addPath(
            getOneStepPath(stepX, y, false, false, radius, halfLineHeight),
            Offset(offsetX, 0));*/
      }
    }
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
            getOneStepPath(stepX, y, false, true, radius, halfLineHeight),
            Offset(offsetX, 0));
      } else if (i == (steps - 1)) {
        // Now the endStep will be added. OBS does nothing different now.
        path.addPath(
            getOneStepPath(stepX, y, true, false, radius, halfLineHeight),
            Offset(offsetX, 0));
        // Adds the rounded edge at the end
        path.addOval(Rect.fromCircle(
            center: Offset(x - halfLineHeight, y / 2), radius: halfLineHeight));
      } else {
        path.addPath(
            getOneStepPath(stepX, y, false, false, radius, halfLineHeight),
            Offset(offsetX, 0));
      }
    }

    return path;
  }

  @override
  bool shouldRepaint(ProgressPainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
