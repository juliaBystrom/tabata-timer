import 'package:flutter/material.dart';
import '../tabataInfo.dart';
import './timeChooser.dart';
import '../StyleCollection/textStyles.dart';



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
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimeChooser(widget.tabataInfo, "Work time:",
                widget.tabataInfo.changeSecondsWorkTime, false),
            TimeChooser(widget.tabataInfo, "Rest time:",
                widget.tabataInfo.changeSecondsRestTime, true),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Cycles:",
              textScaleFactor: 2,
              style: TextStyles().textStyle,

            ),
            Row(
              children: [
                FlatButton(
                  shape: CircleBorder(),
                  onPressed: () {
                    setState(() {
                      widget.tabataInfo.changeNrOfcycles(-1);
                    });
                  },
                  child: Icon(
                    Icons.remove,
                    size: 40,
                  ),
                ),
                Text(
                  "${widget.tabataInfo.nrOfCycles.toString().padLeft(2, '0')}",
                  textScaleFactor: 3,
                  style: TextStyles().textStyleNumbers,
                ),
                FlatButton(
                  shape: CircleBorder(),
                  onPressed: () {
                    setState(() {
                      widget.tabataInfo.changeNrOfcycles(1);
                    });
                  },
                  child: Icon(
                    Icons.add,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tabatas:",
              textScaleFactor: 2,
              style: TextStyles().textStyle,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  shape: CircleBorder(),
                  onPressed: () {
                    setState(() {
                      widget.tabataInfo.changeNrOfTabatas(-1);
                    });
                  },
                  child: Icon(
                    Icons.remove,
                    size: 40,
                  ),
                ),
                Text(
                  "${widget.tabataInfo.nrOfTabatas.toString().padLeft(2, '0')}",
                  textScaleFactor: 3,
                  style: TextStyles().textStyleNumbers,
                ),
                FlatButton(
                  shape: CircleBorder(),
                  onPressed: () {
                    setState(() {
                      widget.tabataInfo.changeNrOfTabatas(1);
                    });
                  },
                  child: Icon(
                    Icons.add,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
