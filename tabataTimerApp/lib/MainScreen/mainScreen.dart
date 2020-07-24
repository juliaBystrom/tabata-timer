import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import '../timeInfo.dart';
import './clockDisplay.dart';
import '../tabataInfo.dart';
import 'carousel.dart';

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
    var timeInfo = Provider.of<TimeInfo>(context, listen: false);

    if (timeInfo.getIsActive()) {
      timeInfo.tick();
      // Because the timer will count from inputed time to 1, the check secondsPassed <= 0 will make
      // the timer not display 0
      if (timeInfo.getSecondsLeft() <= 0) {
        print("timeInfo provider updates tabata progress");
        updateTabataProgress();
      }
    }
  }

  void updateTabataProgress() {
    var timeInfo = Provider.of<TimeInfo>(context, listen: false);
    // OBS updateInfo need to be valled before geting the time
    tabataHandler.updateInfo();

    // The timer will count from inputed time to 1 and then reset. Intead of inputtime-1 to 0.
    // the +1 is because the timer will start with subtracting 1.
    timeInfo.setTime(tabataHandler.getActiveTime() + 1);
  }

  void newTabataInfo() {
    var timeInfo = Provider.of<TimeInfo>(context, listen: false);
    timeInfo.setTime(tabataHandler.getActiveTime() + 1);

    setState(() {
      tabataHandler = widget.tabataInfo.getTabataHandler();
    });
    print("New Tabata ready to start");
  }

  void timerOnOff() {
    var timeInfo = Provider.of<TimeInfo>(context, listen: false);
    timeInfo.reverseActive();
  }

  void timerFinish() {
    var timeInfo = Provider.of<TimeInfo>(context, listen: false);
    timeInfo.setTime(tabataHandler.getActiveTime());
    timeInfo.setIsActive(false);
  }

  @override
  Widget build(BuildContext context) {
    // I could probably put this in the parent widget
    if (timer == null) {
      // timer = Timer(duration, handleTick);
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }

    if (!widget.mainScreenFunctionsSet) {
      widget.tabataInfo
          .setMainScreenFunctions(newTabataInfo, timerOnOff, timerFinish);

      widget.mainScreenFunctionsSet = true;
    }
    return Container(
      // color: Colors.deepOrange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Consumer<TimeInfo>(
            builder: (context, value, child) {
              int timeInSeconds = value.getSecondsLeft();
              int seconds = timeInSeconds % 60;
              // Truncate the number to get rid of decimal that represent seconds
              int minutes = timeInSeconds ~/ 60;
              return ClockDisplay(minutes, seconds);
            },
          ),
          Carousel(widget.tabataInfo),
        ],
      ),
    );
  }
}
