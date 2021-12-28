import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/widgets.dart';

class HomeDansoHistoryScreen extends StatefulWidget {
  const HomeDansoHistoryScreen({Key? key}) : super(key: key);

  @override
  State<HomeDansoHistoryScreen> createState() => _HomeDansoHistoryScreenState();
}

class _HomeDansoHistoryScreenState extends State<HomeDansoHistoryScreen> {
  var controller = Get.find<MainScreenController>();

  @override
  void dispose() {
    super.dispose();
    if (controller.musicState.value) {
      controller.player.play();
    }
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
              TabText('역사'),
              TabText('종류'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // 탭바 화면
            //첫번째 화면
            DansoHistroyKind(
                subject: HISTORY_TITLE,
                explanation: HISTORY,
                url: DANSO_HISTORY_URL),
            // 두번째 화면
            DansoHistroyKind(
                subject: DANSO_KIND_TITLE,
                explanation: DANSO_KIND,
                url: DANSO_KIND_URL),
            // 화면 2
          ],
        ),
      ),
    );
  }
}
