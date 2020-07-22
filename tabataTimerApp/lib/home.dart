import 'package:flutter/material.dart';
import './MainScreen/mainScreen.dart';
import 'SettingsWidgets/ButtonSettingsSheet.dart';
import 'tabataInfo.dart';
import './StartButton/startTimer.dart';
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
              height: 70,
              child: StopButton(
                  widget.tabataInfo, changeBottomNavBarVisibility, size),
            ),
          ),
          TableCell(
            child: Container(
              height: 70,
              child: PausButton(
                  widget.tabataInfo, changeBottomNavBarVisibility, size),
            ),
          ),
        ]),
      ],
    );

    return Scaffold(
      body: MainScreen(widget.tabataInfo),
      backgroundColor: Color(0xffFFF8F0),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff340068),

        child: Container(
          height: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 70,
                child: widget.tabataInfo.tabataTrainingIsOn
                    ? pausStopButtons
                    : StartButton(
                        widget.tabataInfo, changeBottomNavBarVisibility, size),
              ),
              widget.showNavBar
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
            ],
          ),
        ),
      ),
      // extendBody: true,
    );
  }
}
