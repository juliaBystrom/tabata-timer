
class TabtaInfo {
  int secondsWorkTime;
  int secondsRestTime;
  int nrOfCycles;
  int nrOfTabatas;

  TabtaInfo(){
    secondsWorkTime = 20;
    secondsRestTime = 10;
    nrOfCycles = 10;
    nrOfTabatas = 3;
  }

  void setSecondsWorkTime(int s){
    secondsWorkTime = s;
  }

  void setSecondsRestTime(int s){
    secondsRestTime = s;
  }

  void setNrOfcycles(int nr){
    nrOfCycles = nr;
  }

  void changeNrOfcycles(int n){
    if(0 < (nrOfCycles + n) && (nrOfCycles + n) < 99){
      nrOfCycles = nrOfCycles + n;
    }
  }

  void setNrOfTabatas(int nr){
    nrOfTabatas = nr;
  }

  void changeNrOfTabatas(int n){
    if(0 < (nrOfTabatas + n) && (nrOfTabatas + n) < 99){
      nrOfTabatas = nrOfTabatas + n;
    }
  }

}
