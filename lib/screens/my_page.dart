import 'package:flutter/material.dart';
import 'package:project_danso/widgets/widgets.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: tabbarAndAppBar(
          title: '마이페이지',
          tabbar: defaultTabBar(
            scrollable: true,
            tabList: [
              Tab(text: '기록'),
              Tab(text: '관심곡'),
              Tab(text: '연주듣기'),
              Tab(text: '연주보기'),
              Tab(text: '마이곡'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TestBlankPage(),
            TestBlankPage(),
            TestBlankPage(),
            TestBlankPage(),
            TestBlankPage(),
          ],
        ),
      ),
    );
  }
}
