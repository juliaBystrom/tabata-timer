import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextStyle textStyle = TextStyle(
    // color: Color(0xff182825),
    color: Color(0xff241C00));

final TextStyle textStyleNumbers = GoogleFonts.cutiveMono(
  // Link: https://fonts.google.com/specimen/Cutive+Mono?preview.text_type=numerals&category=Monospace&sort=popularity&preview.size=66#standard-styles
  color: Color(0xff241C00),
  fontWeight: FontWeight.bold,
);

enum WorkoutStatus {
  notStarted,
  tabataOn,
  finished,
}

enum TabataStatus {
  preparing,
  working,
  resting,
}
