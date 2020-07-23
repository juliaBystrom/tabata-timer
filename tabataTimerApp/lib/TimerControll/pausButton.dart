import 'package:flutter/material.dart';
import '../tabataInfo.dart';
import '../StyleCollection/textStyles.dart';

class PausButton extends StatefulWidget {
  final TabtaInfo tabataInfo;
  final Function changeBottomNavBarVisibility;
  final TextStyle textStyle = TextStyles().textStyle;

  PausButton(this.tabataInfo, this.changeBottomNavBarVisibility);

  @override
  _PausButtonState createState() => _PausButtonState();
}

class _PausButtonState extends State<PausButton> {
  void onPressFunction() {
    setState(() {
      // widget.tabataInfo.startTabata(false);
      widget.tabataInfo.pausWorkout();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          onPressFunction();
        },
        materialTapTargetSize: MaterialTapTargetSize.padded,
        color: widget.tabataInfo.tabataTrainingIsPaused
            ? Color(0xff31CB00)
            : Color(0xffF5B700),
        child: Text(
          widget.tabataInfo.tabataTrainingIsPaused ? "CONTINUE" : "PAUS",
          style: widget.textStyle,
        ),
      
    );
  }
}
