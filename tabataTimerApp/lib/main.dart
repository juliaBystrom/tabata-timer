import 'package:flutter/material.dart';
import './mainScreen.dart';
import './home.dart';
import 'package:flutter/services.dart';



void main() {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
/*       theme: ThemeData(
        // primarySwatch: Colors.blue,
        //fontFamily: GoogleFonts.squadaOne(color: Colors.cyanAccent).toString(),
        



        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ), */
      home: Home(),
    );
  }
}
