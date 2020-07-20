import 'package:flutter/material.dart';
import '../tabataInfo.dart';
import './timeChooser.dart';
import 'package:google_fonts/google_fonts.dart';


class SettingsPane extends StatefulWidget {
  final TabtaInfo tabataInfo;
  SettingsPane(this.tabataInfo);

  final TextStyle textStyle = GoogleFonts.squadaOne(
    // fontSize: 20,
    color: Color(0xff182825),
  );

  final TextStyle textStyleNumbers = GoogleFonts.cutiveMono(
    // Link: https://fonts.google.com/specimen/Cutive+Mono?preview.text_type=numerals&category=Monospace&sort=popularity&preview.size=66#standard-styles
    // fontSize: 20,
    color: Color(0xff182825),
  );

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
              style: widget.textStyle,

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
                  style: widget.textStyleNumbers,
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
              style: widget.textStyle,
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
                  style: widget.textStyleNumbers,
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
