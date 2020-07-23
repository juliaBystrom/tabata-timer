import 'package:flutter/material.dart';
import './MainScreen/mainScreen.dart';
import 'SettingsWidgets/ButtonSettingsSheet.dart';
import 'tabataInfo.dart';
import './StartButton/startButton.dart';
import './StartButton/stopButton.dart';
import './StartButton/pausButton.dart';

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
    Size size = MediaQuery.of(context).size;

    var pausStopButtons = Table(
      columnWidths: {
        0: FractionColumnWidth(0.5),
        1: FractionColumnWidth(0.5),
      },
      children: [
        TableRow(children: [
          TableCell(
            child: Container(
              height: 140,
              child: PausButton(
                  widget.tabataInfo, changeBottomNavBarVisibility, size),
            ),
          ),
          TableCell(
            child: Container(
              height: 140,
              child: StopButton(
                  widget.tabataInfo, changeBottomNavBarVisibility, size),
            ),
          ),
        ]),
      ],
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0x5fff930f),
              const Color(0x5ffff95b),
            ],
          ),
        ),
        child: MainScreen(widget.tabataInfo),
      ),
      backgroundColor: Color(0xffFFF8F0),

      bottomNavigationBar: BottomAppBar(
        color: Color(0xff340068),
        // color: Color(0xff271F30),
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xffff930f),
                const Color(0xfffff95b),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 70,
                child: widget.tabataInfo.workoutStarted()
                    ? pausStopButtons
                    : StartButton(
                        widget.tabataInfo, changeBottomNavBarVisibility, size),
              ),
              widget.showNavBar
                  ? Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Placeholder(
                            fallbackHeight: 60,
                            fallbackWidth: 60,
                          ),
                          ButtonSettingsSheet(widget.tabataInfo)
                        ],
                      ),
                    )
                  : Container(
                      // empty container
                      ),
            ],
          ),
        ),
      ),
      // extendBody: true,
    );
  }
}
