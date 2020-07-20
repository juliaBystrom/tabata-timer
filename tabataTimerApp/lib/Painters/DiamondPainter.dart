import 'package:flutter/material.dart';


class DiamondPainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  Gradient gradient = RadialGradient(
      //begin: Alignment.topCenter,
      // end:FractionalOffset(0.5, 0.6),
      // end: Alignment.bottomCenter,
      center: FractionalOffset(0.5, 0.5),
      colors: [
        const Color(0xffFFF8F0),
        const Color(0xff9E7B9B),
      ],
      tileMode: TileMode.mirror // repeats the gradient over the canvas
      );

  DiamondPainter(
      {this.strokeColor = Colors.black,
      this.strokeWidth = 3,
      this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      // ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle
      ..shader = gradient.createShader(
          // Rect.fromLTRB(0, 0, size.height, size.width)
          Rect.fromCircle(
              center: Offset(size.width / 2, size.height / 2),
              radius: size.height / 1.5));

    Paint outline = Paint()
      ..color = Color(0xffFB5607)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
    // canvas.drawPath(getTrianglePath(size.width, size.height), outline);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0+(x/10), y / 2)
      ..lineTo(x / 2, 0)
      ..lineTo(x-(x/10), y / 2)
      ..lineTo(x / 2, y)
      ..lineTo(0+(x/10), y / 2);

     /*  Path()
      ..moveTo(0, y / 2)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y / 2)
      ..lineTo(x / 2, y)
      ..lineTo(0, y / 2); */
  }

  @override
  bool shouldRepaint(DiamondPainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
