import 'package:flutter/material.dart';
import 'dart:async';
import './clockDisplay.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  static const duration = const Duration(seconds: 1);

  int secondsPassed = 100;
  bool isActive = false;
  Timer timer;

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;

    if (timer == null) {
      // timer = Timer(duration, handleTick);
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }

    // int hours = secondsPassed ~/ (60 * 60);

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClockDisplay(minutes, seconds),
          RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Text(isActive ? 'STOP' : 'START'),
            onPressed: () {
              setState(() {
                isActive = !isActive;
              });
            },
          )

        ],
      ),
    );
  }
}



