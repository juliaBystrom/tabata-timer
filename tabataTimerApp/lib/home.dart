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
      body: Start(),
      floatingActionButton: FloatingActionButtonBottomSettingsSheet(widget.tabataInfo),
      backgroundColor: Color(0xffFFF8F0),
      // bottomSheet: Container(color: Colors.blue, height: 50),
    );
  }
}

