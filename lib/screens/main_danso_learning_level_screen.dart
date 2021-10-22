import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/widgets.dart';

class MainDansoLearningLevelScreen extends StatelessWidget {
  const MainDansoLearningLevelScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: tabbarAndAppBar(
          title: '단소 학습 익히기',
          tabbar: defaultTabBar(
            tabList: [
              Tab(text: '1'),
              Tab(text: '2'),
              Tab(text: '3'),
              Tab(text: '4'),
              Tab(text: '5'),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            DansoStepByStep(levelcount: "1", level: level1),
            DansoStepByStep(levelcount: "2", level: level2),
            DansoStepByStep(levelcount: "3", level: level3),
            DansoStepByStep(levelcount: "4", level: level4),
            DansoStepByStep(levelcount: "5", level: level5),
          ],
        ),
      ),
    );
  }
}
