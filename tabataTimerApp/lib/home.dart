import 'package:flutter/material.dart';
import './start.dart';
import 'SettingsWidgets/FloatingActionButtonBottomSettingsSheet.dart';
import 'tabataInfo.dart';


class Home extends StatefulWidget {
  final TabtaInfo tabataInfo = new TabtaInfo();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Start(widget.tabataInfo),
      backgroundColor: Color(0xffFFF8F0),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,//Color(0xff340068),
        shape: const CircularNotchedRectangle(),
        // elevation: 5,
        child: Container(
          height: 100,
          color: Colors.red,//Color(0xff340068),
          child: Text("Hej"),

        ),
      ),
      floatingActionButton: FloatingActionButtonBottomSettingsSheet(widget.tabataInfo),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}

