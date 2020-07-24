import 'package:flutter/foundation.dart';

class TimeInfo extends ChangeNotifier {
  int _secondsLeft;
  bool _isActive = false;
  int _elapsedSeconds = 0;
  TimeInfo(this._secondsLeft);

  int getSecondsLeft() => _secondsLeft;
  int getElapsedSeconds() => _elapsedSeconds;

  void tick() {
    _secondsLeft--;
    _elapsedSeconds++;
    notifyListeners();
  }

  void setTime(int t) {
    _secondsLeft = t;
    notifyListeners();
  }

  void resetElapsedTime() {
    // Reset progress bar;
    _elapsedSeconds = 0;
    notifyListeners();
  }

  bool getIsActive() => _isActive;

  void reverseActive() {
    _isActive = !_isActive;
    // notifyListeners();
  }

  void setIsActive(bool b) {
    _isActive = b;
    // notifyListeners();
  }
}
