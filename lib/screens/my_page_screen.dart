import 'package:flutter/material.dart';
import 'package:project_danso/widgets/widgets.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({Key? key}) : super(key: key);

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
            MyPageRecord(songname: '곡이름'), //곡이름에 맞는 점수와 그래프필요함
            MyPageLike(songname: '곡이름'), //곡이름에 맞는 점수와 좋아요 의 유뮤 체크 필요
            MyPageListen(
                songname: '곡이름',
                date: '날짜'), //곡이름 날짜,시간 곡에맞는 플레이 파일 공유and삭제기능필요
            MyPageLook(songname: '곡이름', date: '날짜'),
            MyPageMysong(), //마이곡 이름 공유and삭제기능 필요
          ],
        ),
      ),
    );
  }
}
