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
  static Color textColor = const Color(0xff182825);
  static Color textColorRed = const Color(0xffF25F5C);

  double fontSizeMinutes;
  double fontSizeSeconds;

  // Used for Solving an align issue
  TextStyle biggestTextStyle = GoogleFonts.squadaOne(
    fontSize: 230,
  );
  bool showMinutesBigg;
  bool showRedSecond;
  bool showRedMinute;

  @override
  Widget build(BuildContext context) {
    // True when nr of minutes have recently or is about to change, also when the tabata is new and the time is close to one minute
    showMinutesBigg =
        ((widget.minutes > 0 && widget.seconds < 5) || widget.seconds > 55);


    // Textstyles for the digits
    TextStyle minutesTextStyle = GoogleFonts.squadaOne(
      fontSize: 110,
      color: textColor,
      // color: widget.minutes <= 1 ? textColorRed : textColor,
    );

    TextStyle secondsTextStyle = GoogleFonts.squadaOne(
      fontSize: 230,
      color: widget.seconds <= 3 ? textColorRed : textColor,
    );

    TextStyle mediumTextStyleMinutes = GoogleFonts.squadaOne(
      fontSize: 170,
      color: textColor,
      // color: widget.minutes <= 1 ? textColorRed : textColor,
    );

    TextStyle mediumTextStyleSeconds = GoogleFonts.squadaOne(
      fontSize: 170,
      color: widget.seconds <= 3 ? textColorRed : textColor,
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
          // Uncomment the line above to see the borders of the digits
          // border: TableBorder.all(),
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
                child: AnimatedDefaultTextStyle(
                  style: showMinutesBigg
                      ? mediumTextStyleMinutes
                      : minutesTextStyle,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.bounceOut,
                  textAlign: showMinutesBigg ? TextAlign.start : TextAlign.end,
                  child: Text(
                    firstDigitMinute,
                    //TtextAlign: showMinutesBigg ? TextAlign.start : TextAlign.end,
                  ),
                ),
              ),
              TableCell(
                child: AnimatedDefaultTextStyle(
                  style: showMinutesBigg
                      ? mediumTextStyleMinutes
                      : minutesTextStyle,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.bounceOut,
                  textAlign: showMinutesBigg ? TextAlign.end : TextAlign.start,
                  child: Text(
                    secondDigitMinute,
                  ),
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
                child: AnimatedDefaultTextStyle(
                  style: showMinutesBigg
                      ? mediumTextStyleSeconds
                      : secondsTextStyle,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.bounceOut,
                  textAlign: showMinutesBigg ? TextAlign.end : TextAlign.start,
                  child: Text(
                    firstDigitSecond,
                  ),
                ),
              ),
              TableCell(
                child: AnimatedDefaultTextStyle(
                  style: showMinutesBigg
                      ? mediumTextStyleSeconds
                      : secondsTextStyle,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.bounceOut,
                  textAlign: showMinutesBigg ? TextAlign.start : TextAlign.end,
                  child: Text(
                    secondDigitSecond,
                  ),
                ),
              ),
            ])
          ],
        ));
  }
}
