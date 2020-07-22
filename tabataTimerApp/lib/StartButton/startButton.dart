import 'package:flutter/material.dart';
import '../tabataInfo.dart';
import '../StyleCollection/textStyles.dart';

class StartButton extends StatefulWidget {
  final TabtaInfo tabataInfo;
  final Function changeBottomNavBarVisibility;
  final TextStyle textStyle = TextStyles().textStyle;
  Size size;

  StartButton(this.tabataInfo, this.changeBottomNavBarVisibility, this.size);

  @override
  _StartButtonState createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  void onPressFunction() {
    setState(() {
      widget.tabataInfo.startTabata(false);
      widget.changeBottomNavBarVisibility();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        onPressFunction();
        print(MediaQuery.of(context).size.width);
      },
      materialTapTargetSize: MaterialTapTargetSize.padded,
      color: Color(0xff31CB00),
      child: Text(
        "START",
        style: widget.textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
