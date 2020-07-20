import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  final TextStyle minutesTextStyle = GoogleFonts.squadaOne(
    fontSize: 150,
  );

  final TextStyle secondsTextStyle =  GoogleFonts.squadaOne(
    fontSize: 150,
    // color: Colors.cyanAccent,
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
                text: "${widget.minutes.toString().padLeft(2, '0')}:",
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
