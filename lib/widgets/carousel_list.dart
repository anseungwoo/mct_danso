import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselListWidget extends StatefulWidget {
  List<Widget> carouselList = [];

  CarouselListWidget({Key? key, required this.carouselList}) : super(key: key);

  @override
  State<CarouselListWidget> createState() => _CarouselListWidgetState();
}

class _CarouselListWidgetState extends State<CarouselListWidget> {
  @override
  void initState() {
    super.initState();
  }

  var _current = 0;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enableInfiniteScroll: false,
        onPageChanged: (index, reason) {
          setState(() {
            index = _current;
          });
        },
        height: ScreenUtil().screenHeight - ScreenUtil().statusBarHeight,
        viewportFraction: 1,
      ),
      items: widget.carouselList,
    );
  }
}
