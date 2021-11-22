import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/widgets.dart';

class MainDansoHistoryKindScreen extends StatelessWidget {
  const MainDansoHistoryKindScreen({Key? key}) : super(key: key);

  // 예시 위젯
  Widget testContainer(String explanation) {
    return Container(
      color: Colors.grey,
      height: 150.h,
      width: 331.w,
      child: Center(
          child: Text(
        explanation,
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
                DansoHistroyKind(
                    subject: HISTORY_TITLE,
                    explanation: HISTORY,
                    url: DANSO_HISTORY_URL),
                // 화면 2
              ],
            ),
            // 두번째 화면
            CarouselListWidget(
              carouselList: [
                // 좌우 스크롤 화면
                // 화면 1
                DansoHistroyKind(
                    subject: DANSO_KIND_TITLE,
                    explanation: DANSO_KIND,
                    url: DANSO_KIND_URL),
                // 화면 2
              ],
            ),
          ],
        ),
      ),
    );
  }
}
