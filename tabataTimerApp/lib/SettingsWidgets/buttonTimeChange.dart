import 'package:flutter/material.dart';
import '../StyleCollection/triangleClipper.dart';

class ButtonTimeChange extends StatelessWidget {
  final Function onPressFunction;
  final IconData buttonIcon;
  final String sematicLbl;
  final bool pointUp;
  ButtonTimeChange(
      this.onPressFunction, this.buttonIcon, this.sematicLbl, this.pointUp);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TriangleClipper(pointUp),
      child: Container(
        width: 50,
        height: 40,
        decoration: BoxDecoration(
            gradient: RadialGradient(
                // The first color should be closest to the number therefore the following condition statements is done
                center: pointUp ? Alignment.bottomCenter : Alignment.topCenter,
                focal: Alignment.center,
                focalRadius: 1.0,
                colors: [
              Colors.black,
              Color(0xff7DCFB6),
            ])
            ),
        child: FlatButton(
          onPressed: onPressFunction,
          child: Center(
            child: Icon(
              buttonIcon,
              size: 20,
              semanticLabel: sematicLbl,
            ),
          ),
        ),
      ),
    );
  }
}
