import 'package:flutter/material.dart';
import '../tabataInfo.dart';
import '../StyleCollection/textStyles.dart';

class StartTimer extends StatefulWidget {
  final TabtaInfo tabataInfo;
  final Function changeBottomNavBarVisibility;
  StartTimer(this.tabataInfo, this.changeBottomNavBarVisibility);

  final TextStyle textStyle = TextStyles().textStyle;

  @override
  _StartTimerState createState() => _StartTimerState();
}

class _StartTimerState extends State<StartTimer> {
  
  void onPressFunction() {
    setState(() {
      widget.tabataInfo.startTabata();
      widget.changeBottomNavBarVisibility();
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.tabataInfo.tabataTrainingIsOn
        ? Row( children: [RaisedButton(
            onPressed: () {
              onPressFunction();
            },
            materialTapTargetSize: MaterialTapTargetSize.padded,

            color: Color(0xffF25F5C),
            child: Text(
              "PAUS",
              style: widget.textStyle,
            ),
          ),])
        : Row( children:[RaisedButton(
            onPressed: () {
              setState(() {
                onPressFunction();
              });
            },
            materialTapTargetSize: MaterialTapTargetSize.padded,
            color: Color(0xff31CB00),
            child: Text(
              "START",
              style: widget.textStyle,
            ),
          ),]);
  }
}
