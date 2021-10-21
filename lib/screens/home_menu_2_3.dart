import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/widgets.dart';

class HomeMenu23 extends StatelessWidget {
  const HomeMenu23({Key key}) : super(key: key);

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
            DansoStepByStep(level: "1", step: step1),
            DansoStepByStep(level: "2", step: step2),
            DansoStepByStep(level: "3", step: step3),
            DansoStepByStep(level: "4", step: step4),
            DansoStepByStep(level: "5", step: step5),
          ],
        ),
      ),
    );
  }
}
