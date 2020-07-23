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

class TabtaInfo {
  int secondsPrepTime;
  int secondsWorkTime;
  int secondsRestTime;
  int nrOfCycles;
  int nrOfTabatas;
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
    secondsPrepTime = 10;
    secondsWorkTime = 20;
    secondsRestTime = 10;
    nrOfCycles = 10;
    nrOfTabatas = 3;

    // Flag for setting functions
    mainScreenFunctionsSet = false;

    // Creates Default TabataHandler
    tabataHandler = new TabataHandler(secondsPrepTime, secondsWorkTime,
        secondsRestTime, nrOfCycles, nrOfTabatas, finishWorkout);

    // Initilizing the Functions to diminish acsessing null function issues
    newTabataInfo = () => {};
    startTabata = () => {};
    timerOnOff = () => {};
    timerFinish = () => {};

    status = WorkoutStatus.notStarted;

    tabataTrainingIsPaused = false;
  }

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
    if (0 <= (secondsPrepTime + s)) {
      secondsPrepTime = secondsPrepTime + s;
    }
  }

  void changeSecondsWorkTime(int s) {
    if (0 <= (secondsWorkTime + s)) {
      secondsWorkTime = secondsWorkTime + s;
    }
  }

  void changeSecondsRestTime(int s) {
    if (0 <= (secondsRestTime + s)) {
      secondsRestTime = secondsRestTime + s;
    }
  }

  void changeNrOfcycles(int n) {
    if (0 < (nrOfCycles + n) && (nrOfCycles + n) < 99) {
      nrOfCycles = nrOfCycles + n;
    }
  }

  void changeNrOfTabatas(int n) {
    if (0 < (nrOfTabatas + n) && (nrOfTabatas + n) < 99) {
      nrOfTabatas = nrOfTabatas + n;
    }
  }

  void updateTabataHandler() {
    tabataHandler = new TabataHandler(secondsPrepTime, secondsWorkTime,
        secondsRestTime, nrOfCycles, nrOfTabatas, finishWorkout);
  }

  TabataHandler getTabataHandler() {
    return tabataHandler;
  }
}

class TabataHandler {
  int secondsPrepTime;
  int secondsWorkTime;
  int secondsRestTime;
  int nrOfCycles;
  int nrOfTabatas;

  int nrOfActiveTabata;
  int nrOfActiveCycle;
  TabataStatus tabataStatus;

  Function finishWorkout;

  TabataHandler(
      this.secondsPrepTime,
      this.secondsWorkTime,
      this.secondsRestTime,
      this.nrOfCycles,
      this.nrOfTabatas,
      this.finishWorkout) {
    // Start with workout
    tabataStatus = TabataStatus.working;

    nrOfActiveTabata = nrOfTabatas;
    nrOfActiveCycle = nrOfCycles;
  }

  // Depending on the activity (resting or Working) this function gives
  // the total nr of secondsds. OBS when going to the next activity
  // updateInfo need to be called before
  int getActiveTime() {
    switch (tabataStatus) {
      case TabataStatus.working:
        return secondsWorkTime;
        break;
      case TabataStatus.resting:
        return secondsRestTime;
        break;
      case TabataStatus.preparing:
        return secondsPrepTime;
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
        nrOfActiveCycle = nrOfCycles;
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
