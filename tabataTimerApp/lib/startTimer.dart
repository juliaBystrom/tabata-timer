import 'package:flutter/material.dart';
import 'tabataInfo.dart';
import 'package:google_fonts/google_fonts.dart';

class StartTimer extends StatefulWidget {
  TabtaInfo tabataInfo;
  StartTimer(this.tabataInfo);

  final TextStyle textStyle = GoogleFonts.squadaOne(
    // fontSize: 20,
    color: Color(0xff182825),
  );
  @override
  _StartTimerState createState() => _StartTimerState();
}

class _StartTimerState extends State<StartTimer> {
  @override
  Widget build(BuildContext context) {
    return widget.tabataInfo.tabataTrainingIsOn
        ? FloatingActionButton(
            onPressed: () {
              setState(() {
                widget.tabataInfo.startTabata();
              });
            },
            materialTapTargetSize: MaterialTapTargetSize.padded,
            backgroundColor: Color(0xffF25F5C),
            child: Text(
              "PAUS",
              style: widget.textStyle,
            ),
          )
        : FloatingActionButton(
            onPressed: () {
              setState(() {
                widget.tabataInfo.startTabata();
              });
            },
            materialTapTargetSize: MaterialTapTargetSize.padded,
            backgroundColor: Color(0xff31CB00),
            child: Text(
              "START",
              style: widget.textStyle,
            ),
          );
  }
}
