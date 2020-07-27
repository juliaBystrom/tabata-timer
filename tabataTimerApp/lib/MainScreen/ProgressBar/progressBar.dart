import 'package:flutter/material.dart';
import '../../StyleCollection/progressBarClipper.dart';
import '../../StyleCollection/progressPainter.dart';

import 'package:provider/provider.dart';
import '../../timeInfo.dart';
import '../../globals.dart' as globals;

class ProgressBar extends StatefulWidget {
  int totalTabataTime;
  int nrOfTabatas;
  ProgressBar(this.totalTabataTime, this.nrOfTabatas);

  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(20),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipPath(
            clipper: ProgressBarClipper(widget.nrOfTabatas),
            child: Consumer<TimeInfo>(
              builder: (context, value, child) {
                print("update PROGRESS BAR");
                double progress = value.getElapsedSeconds() /
                    (widget.totalTabataTime * widget.nrOfTabatas);

                int tabataNr =
                    (value.getElapsedSeconds() ~/ (widget.totalTabataTime));
                double oneTabataProgressWith =
                    MediaQuery.of(context).size.width / widget.nrOfTabatas;
                double y = MediaQuery.of(context).size.height;
                double x = MediaQuery.of(context).size.width;
                double marginP = oneTabataProgressWith * tabataNr;
                double alignX = ((marginP / x) - 0.5) * 2;

                double radius = oneTabataProgressWith / 3;
                double marginExtra = (oneTabataProgressWith / 3) - radius / 2;
                // If the radius * 2 is bigger than y then the cicles will be painted with the scale 2circles:1path outherwise 1circle:1path
                if (radius * 2 > y) {
                  radius = oneTabataProgressWith / 4;
                  marginExtra = (oneTabataProgressWith / 4) - radius / 2;
                }
                double alignX2 = (((marginP + marginExtra) / x) - 0.5) * 2;

                print("-----");
                print("progress $progress");
                print("tabataNr $tabataNr");
                print("y $y");
                print("marginP $marginP");
                print("alignX $alignX");
                print("alignX2 $alignX2");
                print("-----");

                return Stack(
                  // fit: StackFit.expand,
                  overflow: Overflow.visible,
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
                    LinearProgressIndicator(
                      value: progress,
                      backgroundColor: globals.whiteBackground,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(globals.greenBlue),
                      minHeight: 60,
                    ),
                    
                    Container(
                      // color: Colors.pink,
                      alignment: Alignment(alignX2, 0),
                      // alignment:
                      child: Container(
                        width: radius / 2,
                        child: Text(
                          (tabataNr + 1).toString(),
                          textAlign: TextAlign.center,
                          textWidthBasis: TextWidthBasis.parent,
                          style: globals.progressNrStyle,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
