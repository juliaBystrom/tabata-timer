import 'package:flutter/material.dart';
import 'dart:async';
import './clockDisplay.dart';
import '../tabataInfo.dart';

class MainScreen extends StatefulWidget {
  TabtaInfo tabataInfo;
  TabataHandler tabataHandler;
  int secondsStart;

  bool mainScreenFunctionsSet;

  MainScreen(TabtaInfo tabataInfo) {
    this.tabataInfo = tabataInfo;
    tabataHandler = tabataInfo.tabataHandler;
    secondsStart = tabataHandler.getActiveTime();
    mainScreenFunctionsSet = false;
  }

  @override
  _MainScreenState createState() => _MainScreenState(tabataHandler);
}

class _MainScreenState extends State<MainScreen> {
  static const duration = const Duration(seconds: 1);

  TabataHandler tabataHandler;

  int secondsPassed;
  bool isActive = false;
  Timer timer;
  bool isWorking;
  bool isResting;

  _MainScreenState(this.tabataHandler) {
    secondsPassed = tabataHandler.getActiveTime();
    print("consructor of mainscreenstate sp: $secondsPassed");
  }

  /*  @override
  void initState() {
    tabataHandler = widget.tabataInfo.tabataHandler;
    secondsPassed = tabataHandler.getActiveTime();
    super.initState();
  } */

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed - 1;
        print("secondsPassed = secondsPassed - 1 : $secondsPassed");
        // Because the timer will count from inputed time to 1, the check secondsPassed <= 0 will make
        // the timer not display 0
        if (secondsPassed <= 0) {
          print("sP less than 0");
          updateTabataProgress();
        }
      });
    }
  }

  void updateTabataProgress() {
    // OBS updateInfo need to be valled before geting the time
    tabataHandler.updateInfo();

    // The timer will count from inputed time to 1 and then reset. Intead of inputtime-1 to 0.
    // the +1 is because the timer will start with subtracting 1.
    secondsPassed = tabataHandler.getActiveTime() + 1;
    print(
        "secondsPassed = widget.tabataHandler.getActiveTime() : $secondsPassed");

    // Maybe useless bool
    isWorking = !isWorking;
    isResting = !isResting;
  }

  void newTabataInfo() {
    tabataHandler = widget.tabataInfo.getTabataHandler();

    setState(() {
      secondsPassed = tabataHandler.getActiveTime();
    });
    print("New Tabata ready to start");
  }

  void startTabata(bool finish) {
    // initTabata();
    setState(() {
      if (!finish) {
        isActive = !isActive;
      } else {
        secondsPassed = widget.tabataInfo.tabataHandler.getActiveTime();
        isActive = false;
        print("tabata finished");
      }
    });
    print("Tabata started");
  }

  void timerOnOff() {
    setState(() {
      isActive = !isActive;
    });
  }

  void timerFinish() {
    setState(() {
      secondsPassed = widget.tabataInfo.tabataHandler.getActiveTime();
      isActive = false;
      print("tabata finished");
    });
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

    if (!widget.mainScreenFunctionsSet) {
      // widget.tabataInfo.setMainScreenFunctions(newTabataInfo, startTabata);
      widget.tabataInfo.setMainScreenFunctions(newTabataInfo, timerOnOff,timerFinish);
      
      widget.mainScreenFunctionsSet = true;
    }

    return Container(
      // color: Colors.deepOrange,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClockDisplay(minutes, seconds),
        ],
      ),
    );
  }
}
