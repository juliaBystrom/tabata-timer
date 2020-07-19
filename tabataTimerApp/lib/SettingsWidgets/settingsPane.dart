import 'package:flutter/material.dart';
import '../tabataInfo.dart';
import './timeChooser.dart';

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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TimeChooser(widget.tabataInfo, "Work time:",
            widget.tabataInfo.changeSecondsWorkTime),
        TimeChooser(widget.tabataInfo, "Rest time:",
            widget.tabataInfo.changeSecondsRestTime),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Cycles:",
              textScaleFactor: 2,
            ),
            Row(
              children: [
                FlatButton(
                  shape: CircleBorder(side: BorderSide(color: Colors.green)),
                  onPressed: () {
                    setState(() {
                      widget.tabataInfo.changeNrOfcycles(-1);
                    });
                  },
                  child: Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  ),
                ),
                Text(
                  "${widget.tabataInfo.nrOfCycles.toString().padLeft(2, '0')}",
                  textScaleFactor: 3,
                ),
                FlatButton(
                  shape: CircleBorder(side: BorderSide(color: Colors.green)),
                  onPressed: () {
                    setState(() {
                      widget.tabataInfo.changeNrOfcycles(1);
                    });
                  },
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.red,
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
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  shape: CircleBorder(side: BorderSide(color: Colors.green)),
                  onPressed: () {
                    setState(() {
                      widget.tabataInfo.changeNrOfTabatas(-1);
                    });
                  },
                  child: Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  ),
                ),
                Text(
                  "${widget.tabataInfo.nrOfTabatas.toString().padLeft(2, '0')}",
                  textScaleFactor: 3,
                ),
                FlatButton(
                  shape: CircleBorder(side: BorderSide(color: Colors.green)),
                  onPressed: () {
                    setState(() {
                      widget.tabataInfo.changeNrOfTabatas(1);
                    });
                  },
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.red,
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
