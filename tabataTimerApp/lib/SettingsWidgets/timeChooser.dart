import 'package:flutter/material.dart';
import '../tabataInfo.dart';
import '../StyleCollection/DiamondPainter.dart';
import '../StyleCollection/textStyles.dart';

class TimeChooser extends StatefulWidget {
  final TabtaInfo tabataInfo;
  final String choosenTimeText;
  final Function increaseSeconds;
  // Outherwise Work time
  final bool isRestTime;

  TimeChooser(this.tabataInfo, this.choosenTimeText, this.increaseSeconds,
      this.isRestTime);

  @override
  _TimeChooserState createState() => _TimeChooserState();
}

class _TimeChooserState extends State<TimeChooser> {
  int seconds;

  @override
  Widget build(BuildContext context) {
    seconds = widget.isRestTime
        ? widget.tabataInfo.secondsRestTime
        : widget.tabataInfo.secondsWorkTime;

    return Column(
      // mainAxisSize: MainAxisSize.min,
      // mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Text(
          widget.choosenTimeText,
          textScaleFactor: 2,
          style: TextStyles().textStyle,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: CustomPaint(
                painter: DiamondPainter(
                  strokeColor: Color(0xffFFF8F0),
                  paintingStyle: PaintingStyle.fill,
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        shape: CircleBorder(),
                        // shape: CircleBorder(side: BorderSide(color: Colors.green),),
                        onPressed: () {
                          setState(() {
                            widget.increaseSeconds(60);
                          });
                        },
                        child: Icon(
                          Icons.add,
                          // color: Colors.red,
                          size: 40,
                        ),
                      ),
                      Text(
                        "${(seconds ~/ 60).toString().padLeft(2, '0')}",
                        textScaleFactor: 3,
                        style: TextStyles().textStyleNumbers,
                      ),
                      FlatButton(
                        shape: CircleBorder(),
                        onPressed: () {
                          setState(() {
                            widget.increaseSeconds(-60);
                          });
                        },
                        child: Icon(
                          Icons.remove,
                          size: 40,

                          // color: Colors.red
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
/*             Text(
              ":",
                 textScaleFactor: 3,
            ), */
            CustomPaint(
              painter: DiamondPainter(
                strokeColor: Color(0xffFFF8F0),
                paintingStyle: PaintingStyle.fill,
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  children: [
                    FlatButton(
                      shape: CircleBorder(),
                      onPressed: () {
                        setState(() {
                          widget.increaseSeconds(1);
                        });
                      },
                      child: Icon(
                        Icons.add,
                        size: 40,

                        // color: Colors.red
                      ),
                    ),
                    Text(
                      "${(seconds % 60).toString().padLeft(2, '0')}",
                      textScaleFactor: 3,
                      style: TextStyles().textStyleNumbers,
                    ),
                    FlatButton(
                      shape: CircleBorder(),
                      onPressed: () {
                        setState(() {
                          widget.increaseSeconds(-1);
                        });
                      },
                      child: Icon(
                        Icons.remove,
                        size: 40,

                        // color: Colors.red
                      ),
                    ),
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
