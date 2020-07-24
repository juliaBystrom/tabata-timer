import 'package:flutter/material.dart';
import '../../StyleCollection/progressBarClipper.dart';
import 'package:provider/provider.dart';
import '../../timeInfo.dart';

class ProgressBar extends StatefulWidget {
  int totalTabataTime;
  int nrOfTabatas;
  ProgressBar(this.totalTabataTime,this.nrOfTabatas);

  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(20),
      child: ClipPath(
        clipper: ProgressBarClipper(widget.nrOfTabatas),
        child: Consumer<TimeInfo>(
          builder: (context, value, child) {
            print("update PROGRESS BAR");
            double progress = value.getElapsedSeconds()/(widget.totalTabataTime*widget.nrOfTabatas);
            return LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.pink,
              minHeight: 60,
            );
          },
        ),
      ),
    );
  }
}
