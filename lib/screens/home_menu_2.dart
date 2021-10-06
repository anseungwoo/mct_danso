import 'package:flutter/material.dart';
import 'package:project_danso/widgets/danso_learning.dart';
import 'package:project_danso/widgets/tabbar_and_appbar.dart';
import 'package:project_danso/widgets/widgets.dart';

class HomeMenu2 extends StatelessWidget {
  const HomeMenu2({Key? key}) : super(key: key);

  // 예시 위젯
  Widget testContainer() {
    return Container(
      color: Colors.grey,
      height: 100,
      width: 100,
      child: Center(child: Text('asdfasdf')),
    );
  }

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
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            CarouselListWidget(
              carouselList: [
                DansoLearning(),
                DansoLearning(),
                testContainer(),
              ],
            ),
            TestBlankPage(),
            TestBlankPage(),
          ],
        ),
      ),
    );
  }
}
