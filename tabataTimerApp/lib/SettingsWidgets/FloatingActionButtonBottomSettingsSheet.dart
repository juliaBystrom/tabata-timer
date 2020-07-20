import 'package:flutter/material.dart';
import '../tabataInfo.dart';
import './settingsPane.dart';
import 'dart:async';
import '../Painters/BottomSheetPainer.dart';

class FloatingActionButtonBottomSettingsSheet extends StatefulWidget {
  final TabtaInfo tabataInfo;
  FloatingActionButtonBottomSettingsSheet(this.tabataInfo);
  @override
  _FloatingActionButtonBottomSettingsSheetState createState() =>
      _FloatingActionButtonBottomSettingsSheetState();
}

class _FloatingActionButtonBottomSettingsSheetState
    extends State<FloatingActionButtonBottomSettingsSheet> {
  bool showButton = true;

  @override
  Widget build(BuildContext context) {
    return showButton
        ? FloatingActionButton(
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
                print("stängd modal bottom sheet");
              });

              /*       bottomSheetController.closed.then((value) {
              showFoatingActionButton(true);
                // Updates the tabataHandler with the new settings 
                widget.tabataInfo.updateTabataHandler();

              }); */
            },
          )
        : Container();
  }

  void showFoatingActionButton(bool value) {
    setState(() {
      showButton = value;
    });
  }
}
