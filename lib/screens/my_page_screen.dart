import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/screens/screens.dart';
import 'package:project_danso/widgets/widgets.dart';

// class MyPageScreen extends StatelessWidget {
//   const MyPageScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 5,
//       child: Scaffold(
//         appBar: tabbarAndAppBar(
//           title: '마이페이지',
//           tabbar: defaultTabBar(
//             scrollable: true,
//             tabList: [
//               Tab(text: '기록'),
//               Tab(text: '관심곡'),
//               Tab(text: '연주듣기'),
//               Tab(text: '연주보기'),
//               Tab(text: '마이곡'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             MyPageRecord(songname: '곡이름'), //곡이름에 맞는 점수와 그래프필요함
//             MyPageLike(songname: '곡이름'), //곡이름에 맞는 점수와 좋아요 의 유뮤 체크 필요
//             MyPageListen(
//                 songname: '곡이름',
//                 date: '날짜'), //곡이름 날짜,시간 곡에맞는 플레이 파일 공유and삭제기능필요
//             MyPageLook(songname: '곡이름', date: '날짜'),
//             MyPageMysong(), //마이곡 이름 공유and삭제기능 필요
//           ],
//         ),
//       ),
//     );
//   }
// }
class MyPageScreen extends StatelessWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          tabbarAndAppBar(title: '마이페이지', tabbar: null, enableTabBar: false),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: CircleAvatar(
                backgroundColor: grayBlackColor,
                radius: 50.r,
                child: Text("뱃지 아이콘"),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: grayBlackColor),
                onPressed: () {},
                child: Text("뱃지함>")),
            SizedBox(height: 10.h),
            myPageButton(Icon(Icons.local_fire_department), "내기록",
                MyPageRecord(songname: '곡이름')),
            myPageButton(
                Icon(Icons.favorite), "관심곡", MyPageLike(songname: '곡이름')),
            myPageButton(Icon(Icons.music_note), "연주듣기",
                MyPageListen(songname: '곡이름', date: '날짜')),
            myPageButton(Icon(Icons.play_circle_fill_outlined), "연주보기",
                MyPageLook(songname: '곡이름', date: '날짜')),
            myPageButton(
                Icon(Icons.leaderboard_outlined), "마이곡", MyPageMysong()),
          ],
        ),
      ),
    );
  }

  Widget myPageButton(Icon myicon, String title, Widget page) => Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: 330.w,
          height: 60.h,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: grayBlackColor),
              onPressed: () {
                Get.to(page);
              },
              child: Row(
                children: [
                  myicon,
                  SizedBox(width: 27.w),
                  Text(
                    title,
                    style: TextStyle(fontSize: textEightSize.sp),
                  ),
                ],
              )),
        ),
      );
}
