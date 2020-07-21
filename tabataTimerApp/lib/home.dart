import 'package:flutter/material.dart';
import './MainScreen/mainScreen.dart';
import 'SettingsWidgets/ButtonSettingsSheet.dart';
import 'tabataInfo.dart';
import './StartButton/startTimer.dart';

class Home extends StatefulWidget {
  final TabtaInfo tabataInfo = new TabtaInfo();
  bool showNavBar = true;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void changeBottomNavBarVisibility() {
    setState(() {
      widget.showNavBar = !widget.showNavBar;
      print("show nav bar: " + widget.showNavBar.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
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
          child: widget.showNavBar
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                      onPressed: () => {},
                      child: Text("Button"),
                    ),
                    ButtonSettingsSheet(widget.tabataInfo),
                  ],
                )
              : Container(
                  // empty container
                  ),
        ),
      ),
      floatingActionButton: Container(
        height: 160.0,
        width: 160.0,
        child: FittedBox(
          child: StartTimer(widget.tabataInfo, changeBottomNavBarVisibility),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
