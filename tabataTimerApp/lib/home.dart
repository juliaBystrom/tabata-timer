import 'package:flutter/material.dart';
import './start.dart';
import './tabataInfo.dart';

class Home extends StatefulWidget {
  TabtaInfo tabataInfo = new TabtaInfo();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Start(),

      floatingActionButton: MyFloatingActionButton(widget.tabataInfo),
      backgroundColor: Color(0xffFFF8F0),
      // bottomSheet: Container(color: Colors.blue, height: 50),
    );
  }
}

class MyFloatingActionButton extends StatefulWidget {
  TabtaInfo tabataInfo;
  MyFloatingActionButton(this.tabataInfo);
  @override
  _MyFloatingActionButtonState createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
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
                    height: 250,
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
                    child: BottomSheetWidget(widget.tabataInfo),
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

class BottomSheetWidget extends StatefulWidget {
  TabtaInfo tabataInfo;
  BottomSheetWidget(this.tabataInfo);

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Cycles:",
              textScaleFactor: 2,
            ),
            Row(
              children: [
                FlatButton(
                  shape: CircleBorder(side: BorderSide(color: Colors.green)),
                  onPressed: () {
                    setState(() {
                      widget.tabataInfo.changeNrOfcycles(-1);
                    });
                  },
                  child: Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  ),
                ),
                Text(
                  "${widget.tabataInfo.nrOfCycles.toString().padLeft(2, '0')}",
                  textScaleFactor: 3,
                ),
                FlatButton(
                  shape: CircleBorder(side: BorderSide(color: Colors.green)),
                  onPressed: () {
                    setState(() {
                      widget.tabataInfo.changeNrOfcycles(1);
                    });
                  },
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tabatas:",
              textScaleFactor: 2,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  shape: CircleBorder(side: BorderSide(color: Colors.green)),
                  onPressed: () {
                    setState(() {
                      widget.tabataInfo.changeNrOfTabatas(-1);
                    });
                  },
                  child: Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  ),
                ),
                Text(
                  "${widget.tabataInfo.nrOfTabatas.toString().padLeft(2, '0')}",
                  textScaleFactor: 3,
                ),
                FlatButton(
                  shape: CircleBorder(side: BorderSide(color: Colors.green)),
                  onPressed: () {
                    setState(() {
                      widget.tabataInfo.changeNrOfTabatas(1);
                    });
                  },
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text("hej ${widget.tabataInfo.nrOfCycles}"),
        Text("då"),
      ],
    );
  }
}
