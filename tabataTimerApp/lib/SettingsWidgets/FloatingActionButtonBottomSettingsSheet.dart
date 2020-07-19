import 'package:flutter/material.dart';
import '../tabataInfo.dart';
import './settingsPane.dart';

class FloatingActionButtonBottomSettingsSheet extends StatefulWidget {
  final TabtaInfo tabataInfo;
  FloatingActionButtonBottomSettingsSheet(this.tabataInfo);
  @override
  _FloatingActionButtonBottomSettingsSheetState createState() => _FloatingActionButtonBottomSettingsSheetState();
}

class _FloatingActionButtonBottomSettingsSheetState extends State<FloatingActionButtonBottomSettingsSheet> {
  bool showButton = true;

  @override
  Widget build(BuildContext context) {
    return showButton
        ? FloatingActionButton(
            // backgroundColor: Colors.green,
            onPressed: () {
              var bottomSheetController = showBottomSheet(
                context: context,
                builder: (context) => Container(
                  color: Color(0xffFFF8F0),
                  child: Container(
                    height: 500,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          const Color(0xff340068),
                          const Color(0xff5200a3),
                          // const Color(0xffFFF8F0)
                        ],
                        radius: 0.8,
                        center: FractionalOffset(0.5, 1),
                      ),

                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      //RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                    padding: EdgeInsets.all(20),
                    child: SettingsPane(widget.tabataInfo),
                  ),
                ),
              );
              showFoatingActionButton(false);
              bottomSheetController.closed.then((value) {
                showFoatingActionButton(true);
              });
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


