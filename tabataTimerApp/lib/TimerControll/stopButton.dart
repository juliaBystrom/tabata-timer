import 'package:flutter/material.dart';
import '../tabataInfo.dart';
import '../globals.dart';


// TODO:  DELETE THIS CLASS AND MAKE THE BUTTON THROUGH startButton
class StopButton extends StatefulWidget {
  final TabtaInfo tabataInfo;
  final Function changeBottomNavBarVisibility;


  StopButton(this.tabataInfo, this.changeBottomNavBarVisibility);

  @override
  _StopButtonState createState() => _StopButtonState();
}

class _StopButtonState extends State<StopButton> {
  void onPressFunction() {
    setState(() {
      //widget.tabataInfo.startTabata(true);
      // widget.tabataInfo.timerFinish();
      widget.tabataInfo.finishWorkout();
      widget.changeBottomNavBarVisibility();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        onPressFunction();
      },
      materialTapTargetSize: MaterialTapTargetSize.padded,
      color: Color(0xffF25F5C),
      child: Text(
        "STOP",
        style: textStyle,
      ),
    );
  }
}
