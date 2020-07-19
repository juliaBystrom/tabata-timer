import 'package:flutter/material.dart';
import '../tabataInfo.dart';

class TimeChooser extends StatefulWidget {
  final TabtaInfo tabataInfo;
  final String choosenTimeText;
  final Function increaseSeconds;
 

  TimeChooser(this.tabataInfo, this.choosenTimeText, this.increaseSeconds);
  @override
  _TimeChooserState createState() => _TimeChooserState();
}

class _TimeChooserState extends State<TimeChooser> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.choosenTimeText,
          textScaleFactor: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                FlatButton(
                  shape: CircleBorder(side: BorderSide(color: Colors.green)),
                  onPressed: () {
                    setState(() {
                      widget.increaseSeconds(60);
                    });
                  },
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.red,
                  ),
                ),
                Text(
                  "${(widget.tabataInfo.secondsWorkTime ~/ 60).toString().padLeft(2, '0')}",
                  textScaleFactor: 3,
                ),
                FlatButton(
                  shape: CircleBorder(side: BorderSide(color: Colors.green)),
                  onPressed: () {
                    setState(() {
                      widget.increaseSeconds(-60);
                    });
                  },
                  child: Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Text(
              ":",
              textScaleFactor: 3,
            ),
            Column(
              children: [
                FlatButton(
                  shape: CircleBorder(side: BorderSide(color: Colors.green)),
                  onPressed: () {
                    setState(() {
                      widget.increaseSeconds(1);
                    });
                  },
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.red,
                  ),
                ),
                Text(
                  "${(widget.tabataInfo.secondsWorkTime % 60).toString().padLeft(2, '0')}",
                  textScaleFactor: 3,
                ),
                FlatButton(
                  shape: CircleBorder(side: BorderSide(color: Colors.green)),
                  onPressed: () {
                    setState(() {
                      widget.increaseSeconds(-1);
                    });
                  },
                  child: Icon(
                    Icons.remove_circle,
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
