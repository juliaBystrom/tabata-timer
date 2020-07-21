import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import './StyleCollection/textStyles.dart';

// import 'dart:async';
// Link to font familey https://fonts.google.com/specimen/Squada+One?preview.text=Time+23:34+&preview.text_type=custom&category=Display&sort=popularity&sidebar.open&selection.family=Squada+One#license

class ClockDisplay extends StatefulWidget {
  int minutes;
  int seconds;

  ClockDisplay(this.minutes, this.seconds);

  @override
  _ClockDisplayState createState() => _ClockDisplayState();
}

class _ClockDisplayState extends State<ClockDisplay> {
  final Color textColor = Color(0xff182825);

  double fontSizeMinutes;
  double fontSizeSeconds;

  @override
  Widget build(BuildContext context) {
    // True when nr of minutes have recently or is about to change, also when the tabata is new and the time is close to one minute
    bool showMinutesBigg =
        ((widget.minutes > 0 && widget.seconds < 5) || widget.seconds > 55);

    fontSizeMinutes = showMinutesBigg ? 170 : 110;
    fontSizeSeconds = showMinutesBigg ? 170 : 230;

    TextStyle minutesTextStyle = GoogleFonts.squadaOne(
      fontSize: fontSizeMinutes,
      // backgroundColor: Colors.orange,
    );

    TextStyle secondsTextStyle = GoogleFonts.squadaOne(
      fontSize: fontSizeSeconds,
      // backgroundColor: Colors.yellow,
    );

    // Solving an align issue
    TextStyle biggestTextStyle = GoogleFonts.squadaOne(
      fontSize: 230,
    );

    String firstDigitSecond =
        widget.seconds.toString().padLeft(2, '0').substring(0, 1);
    String secondDigitSecond =
        widget.seconds.toString().padLeft(2, '0').substring(1, 2);

    String firstDigitMinute =
        widget.minutes.toString().padLeft(2, '0').substring(0, 1);
    String secondDigitMinute =
        widget.minutes.toString().padLeft(2, '0').substring(1, 2);

    return Container(
        color: Colors.blue,
        padding: EdgeInsets.all(10),
        child: Table(
          // columnWidths: ,
          border: TableBorder.all(),
          textBaseline: TextBaseline.alphabetic,
          defaultVerticalAlignment: TableCellVerticalAlignment.baseline,

          columnWidths: {
            0: FixedColumnWidth(0),
            1: FractionColumnWidth(0.2),
            2: FractionColumnWidth(0.2),
            3: FixedColumnWidth(25)
          },
          children: [
            TableRow(children: [
              // Solving an align issue
              TableCell(
                child: Text(
                  "",
                  style: biggestTextStyle,
                ),
              ),
              TableCell(
                child: Text(
                  firstDigitMinute,
                  style: minutesTextStyle,
                  //TtextAlign: showMinutesBigg ? TextAlign.start : TextAlign.end,
                  textAlign: showMinutesBigg ? TextAlign.start : TextAlign.end,
                ),
              ),
              TableCell(
                child: Text(
                  secondDigitMinute,
                  style: minutesTextStyle,
                  textAlign: showMinutesBigg ? TextAlign.end : TextAlign.start,
                ),
              ),
              TableCell(
                child: Text(
                  ":",
                  style: GoogleFonts.squadaOne(
                    fontSize: 120,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              TableCell(
                child: Text(
                  firstDigitSecond,
                  style: secondsTextStyle,
                  textAlign: showMinutesBigg ? TextAlign.end : TextAlign.start,
                ),
              ),
              TableCell(
                child: Text(
                  secondDigitSecond,
                  style: secondsTextStyle,
                  textAlign: showMinutesBigg ? TextAlign.start : TextAlign.end,
                ),
              ),
            ])
          ],
        ));
  }
}
