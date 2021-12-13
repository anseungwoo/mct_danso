import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/widgets.dart';

class SongGraph extends StatelessWidget {
  const SongGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: songtabbarAndAppBar(
          title: '노래곡 제목', tabbar: null, enableTabBar: false),
      body: Padding(
        padding: const EdgeInsets.all(basicPadding),
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
                      padding:
                          const EdgeInsets.symmetric(vertical: basicPadding),
                      child: Text(
                        '2021.09.10 14:13',
                        style: TextStyle(
                            fontSize: textEightSize.sp,
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
                                graColorYellow,
                                logoColor,
                              ])),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: basicPadding),
                        child: Text(
                          '100점',
                          style: TextStyle(
                              fontSize: textSevenSize.sp,
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
