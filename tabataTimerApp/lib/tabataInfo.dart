import 'package:flutter/material.dart';
import 'globals.dart';

import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';



class TabtaInfo {
  int _secondsPrepTime;
  int _secondsWorkTime;
  int _secondsRestTime;
  int _nrOfCycles;
  int _nrOfTabatas;
  TabataHandler tabataHandler;
  Function newTabataInfo;
  Function startTabata;

  Function timerOnOff;
  Function timerFinish;

  // bool used if there is an need to check if the functions newTabataInfo and startTabata have
  // been set before acsessed
  bool mainScreenFunctionsSet;
  bool tabataTrainingIsPaused;

  WorkoutStatus status;

  TabtaInfo() {
    // Default values
    _secondsPrepTime = 5;
    _secondsWorkTime = 3;
    _secondsRestTime = 2;
    _nrOfCycles = 3;
    _nrOfTabatas = 3;

    // Flag for setting functions
    mainScreenFunctionsSet = false;

    // Creates Default TabataHandler
    tabataHandler = new TabataHandler(_secondsPrepTime, _secondsWorkTime,
        _secondsRestTime, _nrOfCycles, _nrOfTabatas, finishWorkout);

    // Initilizing the Functions to diminish acsessing null function issues
    newTabataInfo = () => {};
    startTabata = () => {};
    timerOnOff = () => {};
    timerFinish = () => {};

    status = WorkoutStatus.notStarted;

    tabataTrainingIsPaused = false;
  }

  // Getters
  TabataHandler getTabataHandler() => tabataHandler;
  int getSecondsPrepTime() => _secondsPrepTime;
  int getSecondsWorkTime() => _secondsWorkTime;
  int getSecondsRestTime() => _secondsRestTime;
  int getNrOfCycles() => _nrOfCycles;
  int getNrOfTabatas() => _nrOfTabatas;

  void finishWorkout() {
    timerFinish();
    tabataTrainingIsPaused = false;
    status = WorkoutStatus.finished;
    // Resets the tabata progres
    updateTabataHandler();
  }

  void pausWorkout() {
    tabataTrainingIsPaused = !tabataTrainingIsPaused;
    timerOnOff();
  }

  void startWorkout() {
    status = WorkoutStatus.tabataOn;
    timerOnOff();
  }

  bool workoutStarted() {
    return (status == WorkoutStatus.tabataOn) ? true : false;
  }

  void setMainScreenFunctions(Function f, Function g, Function h) {
    newTabataInfo = f;
    timerOnOff = g;
    timerFinish = h;
    mainScreenFunctionsSet = true;
  }

  void changeSecondsPrepTime(int s) {
    if (0 <= (_secondsPrepTime + s)) {
      _secondsPrepTime = _secondsPrepTime + s;
    }
  }

  void changeSecondsWorkTime(int s) {
    if (0 <= (_secondsWorkTime + s)) {
      _secondsWorkTime = _secondsWorkTime + s;
    }
  }

  void changeSecondsRestTime(int s) {
    if (0 <= (_secondsRestTime + s)) {
      _secondsRestTime = _secondsRestTime + s;
    }
  }

  void changeNrOfCycles(int n) {
    if (0 < (_nrOfCycles + n) && (_nrOfCycles + n) < 99) {
      _nrOfCycles = _nrOfCycles + n;
    }
  }

  void changeNrOfTabatas(int n) {
    if (0 < (_nrOfTabatas + n) && (_nrOfTabatas + n) < 99) {
      _nrOfTabatas = _nrOfTabatas + n;
    }
  }

  void updateTabataHandler() {
    tabataHandler = new TabataHandler(_secondsPrepTime, _secondsWorkTime,
        _secondsRestTime, _nrOfCycles, _nrOfTabatas, finishWorkout);
  }
}

class TabataHandler {
  int _secondsPrepTime;
  int _secondsWorkTime;
  int _secondsRestTime;
  int _nrOfCycles;
  int _nrOfTabatas;

  int nrOfActiveTabata;
  int nrOfActiveCycle;
  TabataStatus tabataStatus;

  Function finishWorkout;
  List<TabataStatus> tabataSchedule;
  List<Builder> tabataScheduleContainers;

  TabataHandler(
      this._secondsPrepTime,
      this._secondsWorkTime,
      this._secondsRestTime,
      this._nrOfCycles,
      this._nrOfTabatas,
      this.finishWorkout) {
    // Start with workout
    tabataStatus = TabataStatus.preparing;

    nrOfActiveTabata = _nrOfTabatas;
    nrOfActiveCycle = _nrOfCycles;

    tabataSchedule = createtabataSchedule();
    createTabataScheduleContainers();
  }

  int getStartTime(){
    return _secondsPrepTime;
  }

  List<TabataStatus> createtabataSchedule() {
    // int listsize = 2 * _nrOfCycles * _nrOfTabatas + _nrOfTabatas;
    List<TabataStatus> list = new List();
    for (int i = 0; i < _nrOfTabatas; i++) {
      list.add(TabataStatus.preparing);
      for (int j = 0; j < _nrOfCycles; j++) {
        list.add(TabataStatus.working);
        list.add(TabataStatus.resting);
      }
    }

    return list;
  }

  // Should probably create an own class for this function
  void createTabataScheduleContainers() {
    tabataScheduleContainers = tabataSchedule.map((tabataStatus) {
      String tabataStatusString;
      switch (tabataStatus) {
        case TabataStatus.preparing:
          tabataStatusString = "PREPARE";
          break;
        case TabataStatus.resting:
          tabataStatusString = "REST";
          break;
        case TabataStatus.working:
          tabataStatusString = "WORKOUT";
          break;
        default:
          tabataStatusString = "ERROR";
      }

      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            // padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            alignment: Alignment.center,
            child: Text(
              tabataStatusString,
              style: textStyle,
              textScaleFactor: 4,
              textAlign: TextAlign.center,
            ),
          );
        },
      );
    }).toList();
  }

  List<TabataStatus> getTabataSchedule() {
    return tabataSchedule;
  }

  List<Builder> getTabataScheduleContainers() {
    return tabataScheduleContainers;
  }

  // Depending on the activity (resting or Working) this function gives
  // the total nr of secondsds. OBS when going to the next activity
  // updateInfo need to be called before
  int getActiveTime() {
    switch (tabataStatus) {
      case TabataStatus.working:
        return _secondsWorkTime;
        break;
      case TabataStatus.resting:
        return _secondsRestTime;
        break;
      case TabataStatus.preparing:
        return _secondsPrepTime;
      default:
        {
          print("error: tabataInfo: getActiveTime");
          return 999;
        }
    }
  }

  // Should be called when the timer have gone to 0. Updates the current progress
  // of the tabata. OBS should be called before getActiveTime when transitioning to an another activity
  void updateInfo() {
    if (tabataStatus == TabataStatus.working) {
      tabataStatus = TabataStatus.resting;
    } else if (tabataStatus == TabataStatus.resting) {
      nrOfActiveCycle--;
      if (nrOfActiveCycle <= 0) {
        // Now one tabata have been done
        nrOfActiveTabata--;
        // When an new Tabata is started the number of cycles need to be reseted
        nrOfActiveCycle = _nrOfCycles;
        // New tabata starts with preparing time
        tabataStatus = TabataStatus.preparing;
      } else {
        tabataStatus = TabataStatus.working;
      }
    } else if (tabataStatus == TabataStatus.preparing) {
      tabataStatus = TabataStatus.working;
    }

    if (nrOfActiveTabata <= 0) {
      // Now all tabatas have been done
      finishWorkout();
    }
  }
}
