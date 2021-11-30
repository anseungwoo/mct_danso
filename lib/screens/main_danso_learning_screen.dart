import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/widgets.dart';

class MainDansoLearningScreen extends StatefulWidget {
  const MainDansoLearningScreen({Key? key}) : super(key: key);

  @override
  State<MainDansoLearningScreen> createState() =>
      _MainDansoLearningScreenState();
}

class _MainDansoLearningScreenState extends State<MainDansoLearningScreen> {
  var controller = Get.find<MainScreenController>();

  @override
  void initState() {
    super.initState();
    if (controller.musicState) {
      // 아예 정지
      // Get.find<MainScreenController>().disposeAudioPlayer();
      // 일시 정지
      controller.assetsAudioPlayer.pause();
    }
  }

  @override
  void dispose() {
    super.dispose();

    if (controller.musicState) {
      controller.assetsAudioPlayer.play();
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: tabbarAndAppBar(
          title: '단소 학습 익히기',
          tabbar: defaultTabBar(
            tabList: [
              TabText('기초 학습'),
              TabText('운지법'),
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
        ),
        CarouselListWidget(
          carouselList: [
            DansoHistroyKind(
                subject: DANSO_PALY_TITLE,
                explanation: DANSO_PALY,
                url: DANSO_PALY_URL),
            PictureAndText(
              title: DANSO_CODE_TITLE[0],
              contant: DANSO_CODE_CONTANT[0],
              image: DANSO_CODE_PNG[0],
            ),
            PictureAndText(
              title: DANSO_CODE_TITLE[1],
              contant: DANSO_CODE_CONTANT[1],
              image: DANSO_CODE_PNG[1],
            ),
            PictureAndText(
              title: DANSO_CODE_TITLE[2],
              contant: DANSO_CODE_CONTANT[2],
              image: DANSO_CODE_PNG[2],
            ),
            PictureAndText(
              title: DANSO_CODE_TITLE[3],
              contant: DANSO_CODE_CONTANT[3],
              image: DANSO_CODE_PNG[3],
            ),
            PictureAndText(
              title: DANSO_CODE_TITLE[4],
              contant: DANSO_CODE_CONTANT[4],
              image: DANSO_CODE_PNG[4],
            ),
            PictureAndText(
              title: DANSO_CODE_TITLE[5],
              contant: DANSO_CODE_CONTANT[5],
              image: DANSO_CODE_PNG[5],
            ),
            fingering(context),
          ],
        )
      ],
    );
  }
}
