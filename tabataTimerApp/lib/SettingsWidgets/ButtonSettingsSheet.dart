import 'package:flutter/material.dart';
import '../tabataInfo.dart';
import './settingsPane.dart';

class ButtonSettingsSheet extends StatefulWidget {
  final TabtaInfo tabataInfo;
  ButtonSettingsSheet(this.tabataInfo);
  @override
  _ButtonSettingsSheetState createState() => _ButtonSettingsSheetState();
}

class _ButtonSettingsSheetState extends State<ButtonSettingsSheet> {
  bool showButton = true;

  void buttonPressed() {
    var bottomSheetController = showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  const Color(0xffFFF8F0),
                  const Color(0xffFFF8F0),
                  Colors.black,
                ],
                focal: Alignment.center,
                radius: 1.8,
                center: FractionalOffset(0.5, 1),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            padding: EdgeInsets.all(20),
            // alignment: Alignment.center,
            //constraints: BoxConstraints.expand(height: 900),
            child: SettingsPane(widget.tabataInfo),
          ),
        ],
      ),
    );
    showFoatingActionButton(false);
    bottomSheetController.whenComplete(() {
      showFoatingActionButton(true);
      // Updates the tabataHandler with the new settings
      widget.tabataInfo.updateTabataHandler();
      /*              while(!widget.tabataInfo.mainScreenFunctionsSet){
                  // waint until the function is set in the tabataInfo 
                } */
      widget.tabataInfo.newTabataInfo();
      print("stängd modal bottom sheet");
    });
  }

  @override
  Widget build(BuildContext context) {
    return showButton
        ? Container(
            height: 60,
            width: 60,
            child: RaisedButton(
              onPressed: buttonPressed,
              child: Center(
                child: Icon(
                  Icons.settings,
                  size: 30,
                  semanticLabel: "Settings",
                ),
              ),
            ),
          )
        : Container(
            // Empty Container
            );
  }

  void showFoatingActionButton(bool value) {
    setState(() {
      showButton = value;
    });
  }
}
