import 'package:flutter/material.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/widgets/widgets.dart';

class StepByStepScreen extends StatelessWidget {
  const StepByStepScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: tabbarAndAppBar(
          title: '단계별 연습',
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
            DansoStepByStep(
                currentLevel: '1', sheetData: level1, jangdan: '굿거리장단'),
            DansoStepByStep(
                currentLevel: '2', sheetData: level2, jangdan: '굿거리장단'),
            DansoStepByStep(
                currentLevel: '3', sheetData: level3, jangdan: '굿거리장단'),
            DansoStepByStep(
                currentLevel: '4', sheetData: level4, jangdan: '굿거리장단'),
            DansoStepByStep(
                currentLevel: '5', sheetData: level5, jangdan: '굿거리장단'),
          ],
        ),
      ),
    );
  }
}
