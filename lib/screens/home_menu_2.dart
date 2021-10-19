import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/widgets.dart';

class HomeMenu2 extends StatelessWidget {
  const HomeMenu2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: tabbarAndAppBar(
          title: '단소 학습 익히기',
          tabbar: defaultTabBar(
            tabList: [
              Tab(text: '연주자세'),
              Tab(text: '율명'),
              Tab(text: '운지법'),
            ],
          ),
        ),
        body: dansoLearningTabBarView(),
      ),
    );
  }

  TabBarView dansoLearningTabBarView() {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        CarouselListWidget(
          carouselList: [
            DansoHistroyKind(
              subject: "단소잡는법과 각부분",
              explanation: DANSOCATCH,
              url: DANSOLIPSURL,
            ),
            DansosubLearning(explanation: DANSOSUBCATCH),
            DansoHistroyKind(
                subject: "단소연주자세", explanation: PALYPOS, url: "LBmB3DGxnNk"),
            DansoHistroyKind(
                subject: "입술모양", explanation: LIPS, url: DANSOLIPSURL),
            DansoHistroyKind(
                subject: "호흡식", explanation: BREATH, url: DANSOBREATHURL),
          ],
        ),
        CarouselListWidget(
          carouselList: [
            DansoHistroyKind(
                subject: "율명", explanation: SHEET, url: DANSOSHEETURL),
            DansoHistroyKind(
                subject: "", explanation: SUBSHEET, url: DANSOSHEETURL),
          ],
        ),
        fingering(),
      ],
    );
  }
}
