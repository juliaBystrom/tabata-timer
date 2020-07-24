import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import '../timeInfo.dart';
import './clockDisplay.dart';
import '../tabataInfo.dart';
import 'ProgressBar/progressBar.dart';
import 'carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MainScreen extends StatefulWidget {
  TabtaInfo tabataInfo;
  TabataHandler tabataHandler;

  bool mainScreenFunctionsSet;

  MainScreen(TabtaInfo tabataInfo) {
    this.tabataInfo = tabataInfo;
    tabataHandler = tabataInfo.tabataHandler;
    // secondsStart = tabataHandler.getActiveTime();
    mainScreenFunctionsSet = false;
  }

  @override
  _MainScreenState createState() => _MainScreenState(tabataHandler);
}

class _MainScreenState extends State<MainScreen> {
  static const duration = const Duration(seconds: 1);
  CarouselController carouselWorkoutStatusController = CarouselController();

  TabataHandler tabataHandler;

  bool isActive = false;
  Timer timer;

  _MainScreenState(this.tabataHandler);

  @override
  void initState() {
    print("new state of mainscreen");
    super.initState();
  }

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
    // OBS updateInfo need to be executed before geting the new time
    tabataHandler.updateInfo();
    // The timer will count from inputed time to 1 and then reset. Intead of inputtime-1 to 0.
    // the +1 is because the timer will start with subtracting 1.
    timeInfo.setTime(tabataHandler.getActiveTime());

    // Change the carousel slide
    carouselWorkoutStatusController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  void newTabataInfo() {
    // Will update the tabatahandler and therefore create a new carousel
    setState(() {
      tabataHandler = widget.tabataInfo.getTabataHandler();
    });
    var timeInfo = Provider.of<TimeInfo>(context, listen: false);
    timeInfo.setTime(tabataHandler.getActiveTime());
    print("New Tabata ready to start");
  }

  void timerOnOff() {
    var timeInfo = Provider.of<TimeInfo>(context, listen: false);
    timeInfo.reverseActive();
  }

  void timerFinish() {
    // Reseting the timer, progrerss bar and carousel
    var timeInfo = Provider.of<TimeInfo>(context, listen: false);
    timeInfo.setTime(tabataHandler.getStartTime());
    timeInfo.setIsActive(false);
    timeInfo.resetElapsedTime();
    carouselWorkoutStatusController.animateToPage(0, duration: Duration(milliseconds: 200), curve: Curves.linear);

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
          Carousel(widget.tabataInfo, carouselWorkoutStatusController),
          ProgressBar(tabataHandler.getTotalTabataTime(),tabataHandler.getNrOfTabatas()),
        ],
      ),
    );
  }
}
