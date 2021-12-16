import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/color.dart';
import 'package:project_danso/common/contant.dart';
import 'package:project_danso/common/icon.dart';
import 'package:project_danso/common/size.dart';
import 'package:project_danso/widgets/widgets.dart';

class SongGraph extends StatelessWidget {
  const SongGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: songtabbarAndAppBar(
          title: '노래곡 제목', tabbar: null, enableTabBar: false),
      body: Padding(
        padding: EdgeInsets.all(MctSize.fifteen.getSize),
        child: Container(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MctSize.fifteen.getSize),
                      child: Text(
                        '2021.09.10 14:13',
                        style: TextStyle(
                            fontSize: MctSize.eighteen.getSize.sp,
                            fontFamily: NOTO_REGULAR),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: ScreenUtil().screenWidth * 100 / 100,
                      height: 35.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                MctColor.gradationColorYellow.getMctColor,
                                MctColor.lightYellow.getMctColor,
                              ])),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MctSize.fifteen.getSize),
                        child: Text(
                          '100점',
                          style: TextStyle(
                              fontSize: MctSize.seventeen.getSize.sp,
                              fontFamily: NOTO_BOLD),
                        ),
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
