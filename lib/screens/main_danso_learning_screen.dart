import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/widgets.dart';

class MainDansoLearningScreen extends StatelessWidget {
  const MainDansoLearningScreen({Key key}) : super(key: key);

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
              explanation: DANSO_CATCH,
              url: DANSO_LIPS_URL,
            ),
            DansosubLearning(explanation: DANSO_SUBCATCH),
            DansoHistroyKind(
                subject: "단소연주자세",
                explanation: PALYPOS,
                url: DANSO_PALYPOS_URL),
            DansoHistroyKind(
                subject: "입술모양", explanation: LIPS, url: DANSO_LIPS_URL),
            DansoHistroyKind(
                subject: "호흡식", explanation: BREATH, url: DANSO_BREATH_URL),
          ],
        ),
        CarouselListWidget(
          carouselList: [
            DansoHistroyKind(
                subject: "율명", explanation: SHEET, url: DANSO_SHEET_URL),
            DansoHistroyKind(
                subject: "", explanation: SUBSHEET, url: DANSO_SHEET_URL),
          ],
        ),
        fingering(),
      ],
    );
  }
}
