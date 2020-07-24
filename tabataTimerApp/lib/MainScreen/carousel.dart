import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../tabataInfo.dart';

class Carousel extends StatefulWidget {
  TabtaInfo _tabataInfo;
  CarouselController carouselWorkoutStatusController;
  Carousel(this._tabataInfo,this.carouselWorkoutStatusController);
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  // final Widget child;

  @override
  Widget build(BuildContext context) {
    print("building carousel widget");
    return Container(
      // height: 200,
      width: MediaQuery.of(context).size.width,

      child: CarouselSlider(
        options: CarouselOptions(
          // aspectRatio: width / height
          aspectRatio: 5 / 2,
          // initialPage: 0,
        ),
        carouselController: widget.carouselWorkoutStatusController,
        items:
            widget._tabataInfo.getTabataHandler().getTabataScheduleContainers(),
      ),
    );
  }
}
