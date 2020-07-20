class TabtaInfo {
  int secondsWorkTime;
  int secondsRestTime;
  int nrOfCycles;
  int nrOfTabatas;
  TabataHandler tabataHandler;

  TabtaInfo() {
    secondsWorkTime = 20;
    secondsRestTime = 10;
    nrOfCycles = 10;
    nrOfTabatas = 3;
    tabataHandler = new TabataHandler(
        secondsWorkTime, secondsRestTime, nrOfCycles, nrOfTabatas);
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

  // Might be useless function
  TabataHandler getNewTabataHandler() {
    return new TabataHandler(
        secondsWorkTime, secondsRestTime, nrOfCycles, nrOfTabatas);
  }

  void updateTabataHandler() {
    tabataHandler = TabataHandler(
        secondsWorkTime, secondsRestTime, nrOfCycles, nrOfTabatas);
  }
}

class TabataHandler {
  int secondsWorkTime;
  int secondsRestTime;
  int nrOfCycles;
  int nrOfTabatas;
  int nrOfCyclesInTabata;
  bool isWorking;
  bool isResting;
  bool finishWorkout;

  TabataHandler(this.secondsWorkTime, this.secondsRestTime, this.nrOfCycles,
      this.nrOfTabatas) {
    // Start with workout
    isWorking = true;
    isResting = false;
    nrOfCyclesInTabata = nrOfCycles;
    finishWorkout = false;
  }

  // Depending on the activity (resting or Working) this function gives
  // the total nr of secondsds. OBS when going to the next activity
  // updateInfo need to be called before
  int getActiveTime() {
    if (isWorking) {
      return secondsWorkTime;
    } else if (isResting) {
      return secondsRestTime;
    } else {
      // error
      return 999;
    }
  }

  // Should be called when the timer have gone to 0. Updates the current progress
  // of the tabata. OBS should be called before getActiveTime when transitioning to an another activity
  void updateInfo() {
    if (isWorking) {
      // Nothing to implement now
    } else if (isResting) {
      nrOfCyclesInTabata--;
    }

    if (nrOfCyclesInTabata <= 0) {
      // Now one tabata have been done
      nrOfTabatas--;
    }

    if (nrOfTabatas <= 0) {
      // Now all tabatas have been done
      finishWorkout = true;
    }

    // Switch from work to rest
    // TO DO implement prepere state between tabatas
    _switchRestWork();
  }

  // function that switches from working to resting state
  void _switchRestWork() {
    isWorking = !isWorking;
    isResting = !isResting;

    if (isResting == isWorking) {
      print("Error: isResting and isWorking is the same");
    }
  }
}
