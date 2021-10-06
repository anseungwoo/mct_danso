import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeMenu1 extends StatelessWidget {
  const HomeMenu1({Key? key}) : super(key: key);

  // 예시 위젯
  Widget testContainer(String Explanation) {
    return Container(
      color: Colors.grey,
      height: 150.h,
      width: 331.w,
      child: Center(
          child: Text(
        Explanation,
        style: TextStyle(fontSize: 15.sp),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: tabbarAndAppBar(
          title: '단소 알아보기',
          tabbar: defaultTabBar(
            tabList: [
              Tab(text: '역사'),
              Tab(text: '종류'),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            // 탭바 화면
            //첫번째 화면
            CarouselListWidget(
              carouselList: [
                // 좌우 스크롤 화면
                // 화면 1
                PictureAndText(subject: "단소의 역사", Explanation: history),
                // 화면 2
                testContainer(subhistory),
              ],
            ),
            // 두번째 화면
            CarouselListWidget(
              carouselList: [
                // 좌우 스크롤 화면
                // 화면 1
                PictureAndText(subject: "평조단소", Explanation: pdanso),
                // 화면 2
                PictureAndText(subject: "경제단소", Explanation: kdanso),
                PictureAndText(subject: "향제단소", Explanation: hdanso),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 예시 화면
class DansoKinds extends StatelessWidget {
  const DansoKinds({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('2')),
    );
  }
}
