import 'package:flutter/material.dart';


class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;
  final bool pointUp;

  Gradient gradient = RadialGradient(
      //begin: Alignment.topCenter,
      // end:FractionalOffset(0.5, 0.6),
      // end: Alignment.bottomCenter,
      center: FractionalOffset(0.5, 0.5),
      colors: [
        const Color(0xffEFFFF8),
        const Color(0xffBDD7C6),
      ],
      tileMode: TileMode.mirror // repeats the gradient over the canvas
      );

  TrianglePainter(this.pointUp,
      {this.strokeColor = Colors.black,
      this.strokeWidth = 3,
      this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
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
    if(pointUp){
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
      
    }else{
      return Path()
      ..moveTo(0, 0)
      ..lineTo(x/2, y)
      ..lineTo(x, 0)
      ..lineTo(0, 0);
      
    }

     /*  Path()
      ..moveTo(0, y / 2)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y / 2)
      ..lineTo(x / 2, y)
      ..lineTo(0, y / 2); */
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
