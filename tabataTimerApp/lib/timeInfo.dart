import 'package:flutter/foundation.dart';

class TimeInfo extends ChangeNotifier {
  int _secondsLeft;
  bool _isActive = false;
  TimeInfo(this._secondsLeft);


  int getSecondsLeft() => _secondsLeft;

  void tick() {
    _secondsLeft--;
    notifyListeners();
  }

  void setTime(int t) {
    _secondsLeft = t;
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
