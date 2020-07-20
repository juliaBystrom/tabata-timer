import 'package:flutter/material.dart';
import 'dart:async';
import './clockDisplay.dart';
import 'tabataInfo.dart';

class Start extends StatefulWidget {
  TabtaInfo tabataInfo;
  TabataHandler tabataHandler;

  Start(TabtaInfo tabataInfo) {
    this.tabataInfo = tabataInfo;
    tabataHandler = tabataInfo.tabataHandler;
  }

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  static const duration = const Duration(seconds: 1);

  int secondsPassed;
  bool isActive = false;
  Timer timer;
  bool isWorking;
  bool isResting;

  @override
  void initState() {
    secondsPassed = widget.tabataHandler.getActiveTime();
    super.initState();
  }

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed - 1;
      });
      if (secondsPassed <= 0) {
        updateTabataProgress();
      }
    }
  }

  void updateTabataProgress() {
    // OBS updateInfo need to be valled before geting the time
    widget.tabataHandler.updateInfo();
    secondsPassed = widget.tabataHandler.getActiveTime();
    // Maybe useless bool
    isWorking = !isWorking;
    isResting = !isResting;
  }

  void initTabata() {
    isWorking = widget.tabataHandler.isWorking;
    isResting = widget.tabataHandler.isResting;
    secondsPassed = widget.tabataHandler.getActiveTime();
  }

  @override
  Widget build(BuildContext context) {
    int seconds = secondsPassed % 60;
    // Truncate the number to get rid of decimal that represent seconds
    int minutes = secondsPassed ~/ 60;

    // I could probably put this in the parent widget
    if (timer == null) {
      // timer = Timer(duration, handleTick);
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }

    // int hours = secondsPassed ~/ (60 * 60);

    return Container(
      // color: Colors.deepOrange,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClockDisplay(minutes, seconds),
          RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Text(isActive ? 'STOP' : 'START'),
            onPressed: () {
              setState(() {
                initTabata();
                isActive = !isActive;
              });
            },
          )
        ],
      ),
    );
  }
}
