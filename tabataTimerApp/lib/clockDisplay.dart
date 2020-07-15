import 'package:flutter/material.dart';
import 'dart:async';

class ClockDisplay extends StatefulWidget {
  int minutes;

  int seconds;
  ClockDisplay(this.minutes, this.seconds);

  @override
  _ClockDisplayState createState() => _ClockDisplayState();
}

class _ClockDisplayState extends State<ClockDisplay> {
  final Color textColor = Color(0xff182825);

  final TextStyle minutesTextStyle = new TextStyle(
    fontSize: 100,
  );

  final TextStyle secondsTextStyle = new TextStyle(
    fontSize: 150,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
            style: TextStyle(
              color: textColor,
            ),
            children: <TextSpan>[
/*               TextSpan(
                text: "min",
                style: TextStyle(fontSize: 20),
              ), */
              TextSpan(
                text: "${widget.minutes.toString().padLeft(2, '0')}",
                style: minutesTextStyle,
              ),
/*               TextSpan(
                text: "sec",
                style: TextStyle(
                  fontSize: 20,
                ),
              ), */
              TextSpan(
                text: "${widget.seconds.toString().padLeft(2, '0')}",
                style: secondsTextStyle,
              ),
            ]),
      ),
    );
  }
}
