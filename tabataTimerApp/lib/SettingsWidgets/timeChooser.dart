import 'package:flutter/material.dart';
import '../tabataInfo.dart';
import '../StyleCollection/DiamondPainter.dart';
import '../StyleCollection/textStyles.dart';
import 'buttonTimeChange.dart';

class TimeChooser extends StatefulWidget {
  final TabtaInfo tabataInfo;
  final String choosenTimeText;
  final Function increaseSeconds;

  final TabataStatus tabataStatus;

  TimeChooser(this.tabataInfo, this.choosenTimeText, this.increaseSeconds,
      this.tabataStatus);

  @override
  _TimeChooserState createState() => _TimeChooserState();
}

class _TimeChooserState extends State<TimeChooser> {
  int seconds;

  @override
  Widget build(BuildContext context) {
    switch (widget.tabataStatus) {
      case TabataStatus.preparing:
        {
          seconds = widget.tabataInfo.secondsPrepTime;
        }
        break;
      case TabataStatus.working:
        {
          seconds = widget.tabataInfo.secondsWorkTime;
        }
        break;
      case TabataStatus.resting:
        {
          seconds = widget.tabataInfo.secondsRestTime;
        }
        break;
    }

    return Flexible(
      // color: Colors.pink,
      flex: 1,
      child: Container(
        color: Colors.green,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.choosenTimeText,
              textScaleFactor: 2,
              style: TextStyles().textStyle,
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
                        textScaleFactor: 3,
                        style: TextStyles().textStyleNumbers,
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
                  textScaleFactor: 3,
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
                        textScaleFactor: 3,
                        style: TextStyles().textStyleNumbers,
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
