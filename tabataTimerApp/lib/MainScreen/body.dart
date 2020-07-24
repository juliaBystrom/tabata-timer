import 'package:flutter/material.dart';
import 'mainScreen.dart';
import '../tabataInfo.dart';
import 'carousel.dart';


class Body extends StatefulWidget {
  TabtaInfo tabataInfo;
  Body(this.tabataInfo);

  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
         children: [
           MainScreen(widget.tabataInfo),
           // Carousel(widget.tabataInfo),
         ],
       )
    );
  }
}