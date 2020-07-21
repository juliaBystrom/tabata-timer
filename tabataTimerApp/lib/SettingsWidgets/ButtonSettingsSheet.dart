import 'package:flutter/material.dart';
import '../tabataInfo.dart';
import './settingsPane.dart';
import 'dart:async';
// import '../Painters/BottomSheetPainer.dart';

class ButtonSettingsSheet extends StatefulWidget {
  final TabtaInfo tabataInfo;
  ButtonSettingsSheet(this.tabataInfo);
  @override
  _ButtonSettingsSheetState createState() => _ButtonSettingsSheetState();
}

class _ButtonSettingsSheetState extends State<ButtonSettingsSheet> {
  bool showButton = true;

  @override
  Widget build(BuildContext context) {
    return showButton
        ? FlatButton(
            // backgroundColor: Colors.green,
            onPressed: () {
              var bottomSheetController = showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => Container(
                  height: 500,
                  // clipBehavior: ,
                  //clipBehavior: Clip.antiAliasWithSaveLayer,

                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xff340068),
                        const Color(0xff5200a3),
                        // const Color(0xff7000e0),
                      ],
                      radius: 0.9,
                      center: FractionalOffset(0.5, 1),
                    ),
                    // shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    // backgroundBlendMode: BlendMode.xor,
                    //RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  ),
                  padding: EdgeInsets.all(20),
                  child: SettingsPane(widget.tabataInfo),
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

              /*       bottomSheetController.closed.then((value) {
              showFoatingActionButton(true);
                // Updates the tabataHandler with the new settings 
                widget.tabataInfo.updateTabataHandler();

              }); */
            },
            shape: CircleBorder(),
            color: Colors.pink,
            child: Container(
              child: Text("Settings"),
            ),
            )
        : Container();
  }

  void showFoatingActionButton(bool value) {
    setState(() {
      showButton = value;
    });
  }
}
