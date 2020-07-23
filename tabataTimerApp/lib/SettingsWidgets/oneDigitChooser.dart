import 'package:flutter/material.dart';
import 'package:tabataTimerApp/StyleCollection/textStyles.dart';
import '../tabataInfo.dart';

import 'buttonTimeChange.dart';

class OneDigitChooser extends StatefulWidget {
  final Function changeNrFunction;
  final TabtaInfo tabataInfo;
  // Work for now using bool, not scalable
  final bool showCyclesOutherwiseTabatas;

  OneDigitChooser(
      this.changeNrFunction, this.tabataInfo, this.showCyclesOutherwiseTabatas);

  @override
  _OneDigitChooserState createState() => _OneDigitChooserState();
}

class _OneDigitChooserState extends State<OneDigitChooser> {
  int displayNr;
  @override
  Widget build(BuildContext context) {
    displayNr = widget.showCyclesOutherwiseTabatas
        ? widget.tabataInfo.nrOfCycles
        : widget.tabataInfo.nrOfTabatas;

    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonTimeChange(() {
            setState(() {
              widget.changeNrFunction(1);
            });
          }, Icons.add, "Add one", true),
          Text(
            "${displayNr.toString().padLeft(2, '0')}",
            textScaleFactor: 2,
            style: TextStyles().textStyleNumbers,
          ),
          ButtonTimeChange(() {
            setState(() {
              widget.changeNrFunction(-1);
            });
          }, Icons.remove, "Decrease one", false),
        ],
      ),
    );
  }
}
