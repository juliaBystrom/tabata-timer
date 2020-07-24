import 'package:flutter/material.dart';
import '../tabataInfo.dart';
import '../globals.dart' as globals;

import 'buttonTimeChange.dart';

class TimeChooser extends StatefulWidget {
  final TabtaInfo tabataInfo;
  final String choosenTimeText;
  final Function increaseSeconds;

  final globals.TabataStatus tabataStatus;

  TimeChooser(this.tabataInfo, this.choosenTimeText, this.increaseSeconds,
      this.tabataStatus);

  @override
  _TimeChooserState createState() => _TimeChooserState();
}

class _TimeChooserState extends State<TimeChooser> {
  int seconds;

  // Because Resting is in the middle
  Border borderResting = Border(
    right: BorderSide(color: Colors.black54, width: 2),
    left: BorderSide(color: Colors.black54, width: 2),
  );

  @override
  Widget build(BuildContext context) {
    switch (widget.tabataStatus) {
      case globals.TabataStatus.preparing:
        {
          seconds = widget.tabataInfo.getSecondsPrepTime();
        }
        break;
      case globals.TabataStatus.working:
        {
          seconds = widget.tabataInfo.getSecondsWorkTime();
        }
        break;
      case globals.TabataStatus.resting:
        {
          seconds = widget.tabataInfo.getSecondsRestTime();
        }
        break;
    }

    return Flexible(
      // color: Colors.pink,
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        // margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          // color: Color(0x2f7DCFB6),
          border: widget.tabataStatus == globals.TabataStatus.resting
              ? borderResting
              : Border(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.choosenTimeText,
              textScaleFactor: 2,
              style: globals.textStyle,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonTimeChange(() {
                        setState(() {
                          widget.increaseSeconds(60);
                        });
                      }, Icons.add, "Add one minute", true),
                      Text(
                        "${(seconds ~/ 60).toString().padLeft(2, '0')}",
                        textScaleFactor: 2,
                        style: globals.textStyleNumbers,
                      ),
                      ButtonTimeChange(() {
                        setState(() {
                          widget.increaseSeconds(-60);
                        });
                      }, Icons.remove, "Decrease one minute", false),
                    ],
                  ),
                ),
                Text(
                  ":",
                  textScaleFactor: 2,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Column(
                    children: [
                      ButtonTimeChange(() {
                        setState(() {
                          widget.increaseSeconds(1);
                        });
                      }, Icons.add, "Add one second", true),
                      Text(
                        "${(seconds % 60).toString().padLeft(2, '0')}",
                        textScaleFactor: 2,
                        style: globals.textStyleNumbers,
                      ),
                      ButtonTimeChange(() {
                        setState(() {
                          widget.increaseSeconds(-1);
                        });
                      }, Icons.remove, "Decrease one seconds", false),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
