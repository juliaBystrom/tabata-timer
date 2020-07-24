import 'package:flutter/material.dart';
import '../tabataInfo.dart';
import './timeChooser.dart';
import '../globals.dart' as globals;

import 'oneDigitChooser.dart';

class SettingsPane extends StatefulWidget {
  final TabtaInfo tabataInfo;
  SettingsPane(this.tabataInfo);

  @override
  _SettingsPaneState createState() => _SettingsPaneState();
}

class _SettingsPaneState extends State<SettingsPane> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          // color: Color(0x2f7DCFB6),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xff7DCFB6), width: 2),
            ),
          ),
          child: Text(
            "Time",
            textScaleFactor: 3,
            style: globals.textStyle
,
          ),
        ),
        Row(children: [
          TimeChooser(widget.tabataInfo, "WORK:",
              widget.tabataInfo.changeSecondsWorkTime, globals.TabataStatus.working),
          TimeChooser(widget.tabataInfo, "REST:",
              widget.tabataInfo.changeSecondsRestTime, globals.TabataStatus.resting),
          TimeChooser(widget.tabataInfo, "PREP:",
              widget.tabataInfo.changeSecondsPrepTime, globals.TabataStatus.preparing),
        ]),
        Container(
          // color: Color(0x2f7DCFB6),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xff7DCFB6), width: 2),
            ),
          ),
          child: Text(
            "Workout",
            textScaleFactor: 3,
            style: globals.textStyle
,
          ),
        ),
        Row(
          children: [
            Flexible(
              // color: Colors.pink,
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                // margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                    // color: Color(0x2f7DCFB6),
                    border: Border(
                        right: BorderSide(color: Colors.black54, width: 1))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "CYCLES:",
                      textScaleFactor: 2,
                      style: globals.textStyle
,
                    ),
                    OneDigitChooser(widget.tabataInfo.changeNrOfCycles,
                        widget.tabataInfo, true),
                  ],
                ),
              ),
            ),
            Flexible(
              // color: Colors.pink,
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                // margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  // color: Color(0x2f7DCFB6),
                  border: Border(
                    left: BorderSide(color: Colors.black54, width: 1),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TABATAS:",
                      textScaleFactor: 2,
                      style: globals.textStyle
,
                    ),
                    OneDigitChooser(widget.tabataInfo.changeNrOfTabatas,
                        widget.tabataInfo, false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
