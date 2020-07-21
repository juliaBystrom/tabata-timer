import 'package:flutter/material.dart';
import './mainScreen.dart';
import 'SettingsWidgets/ButtonSettingsSheet.dart';
import 'tabataInfo.dart';
import 'startTimer.dart';

class Home extends StatefulWidget {
  final TabtaInfo tabataInfo = new TabtaInfo();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {

    // Function newTabataInfo = body.

    return Scaffold(
      body: MainScreen(widget.tabataInfo),
      backgroundColor: Color(0xffFFF8F0),
      bottomNavigationBar: BottomAppBar(
        //Color(0xff340068),

        shape: CircularNotchedRectangle(),
        color: Color(0xff340068),
        // elevation: 5,

        notchMargin: 7.0,
        child: Container(
            height: 70,
            // color: Color(0xff340068),
            // padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  onPressed: () => {},
                  child: Text("Button"),
                ),
                ButtonSettingsSheet(widget.tabataInfo),
              ],
            )),
      ),
      floatingActionButton: Container(
        height: 160.0,
        width: 160.0,
        child: FittedBox(
          child: StartTimer(widget.tabataInfo),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
