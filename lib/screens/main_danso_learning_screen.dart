import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/widgets.dart';

class MainDansoLearningScreen extends StatelessWidget {
  const MainDansoLearningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: tabbarAndAppBar(
          title: '단소 학습 익히기',
          tabbar: defaultTabBar(
            tabList: [
              Tab(text: '기초 학습'),
              Tab(text: '운지법'),
            ],
          ),
        ),
        body: dansoLearningTabBarView(context),
      ),
    );
  }

  TabBarView dansoLearningTabBarView(BuildContext context) {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        CarouselListWidget(
          carouselList: [
            DansoHistroyKind(
              subject: DANSO_CATCH_TITLE,
              explanation: DANSO_CATCH,
              url: DANSO_LIPS_URL,
            ),
            DansoHistroyKind(
              subject: DANSO_CATCH2_TITLE,
              explanation: DANSO_CATCH2,
              url: DANSO_LIPS2_URL,
            ),
            DansoHistroyKind(
                subject: BREATH_TITLE,
                explanation: BREATH,
                url: DANSO_BREATH_URL),
            DansoHistroyKind(
                subject: BREATH2_TITLE,
                explanation: BREATH2,
                url: DANSO_BREATH2_URL),
            DansoHistroyKind(
                subject: SOUND_HL_TITLE,
                explanation: SOUND_HL,
                url: DANSO_SOUND_HL_URL),
            DansoHistroyKind(
                subject: SOUND_TITLE, explanation: SOUND, url: DANSO_SOUND_URL),
          ],
        ),
        CarouselListWidget(
          carouselList: [
            fingering(context),
            DansoHistroyKind(
                subject: DANSO_PALY_TITLE,
                explanation: DANSO_PALY,
                url: DANSO_PALY_URL),
            DansoHistroyKind(
                subject: DANSO_UNM_TITLE,
                explanation: DANSO_UNM,
                url: DANSO_UNM_URL),
            DansoHistroyKind(
                subject: DANSO_SAME_UNM_TITLE,
                explanation: DANSO_SAME_UNM,
                url: DANSO_SAME_UNM_TITLE_URL),
            DansoHistroyKind(
                subject: DANSO_UNM_TEST_TITLE,
                explanation: DANSO_UNM_TEST,
                url: DANSO_UNM_TEST_URL),
          ],
        )
      ],
    );
  }
}
