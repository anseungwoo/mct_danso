import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/screens/screens.dart';
import 'package:project_danso/widgets/widgets.dart';

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
                child: SvgPicture.asset(
                  TEAR_SVG_LIST[0],
                  width: 100.w,
                  height: 100.h,
                )),
            Text(
              "단소 초급자",
              style: TextStyle(fontSize: textEightSize, fontWeight: bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  '다음 랭크까지',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  width: 330.w,
                  height: 7.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: 50 / 100,
                      backgroundColor: expColor,
                      color: mainColor,
                    ),
                  ),
                ),
              ],
            ),
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
        padding: const EdgeInsets.all(7),
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
