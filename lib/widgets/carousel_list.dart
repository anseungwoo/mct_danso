import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/const.dart';

class CarouselListWidget extends StatefulWidget {
  List<Widget> carouselList = [];

  CarouselListWidget({Key key, @required this.carouselList}) : super(key: key);

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
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
            height: ScreenUtil().screenHeight - ScreenUtil().statusBarHeight,
            viewportFraction: 1,
          ),
          items: widget.carouselList,
        ),
        Positioned(
          bottom: 35,
          right: 0,
          left: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.carouselList.map(
                (v) {
                  //these two lines
                  int index = widget.carouselList.indexOf(v); //are changed
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index ? SelectColor : mainColor),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
