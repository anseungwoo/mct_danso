import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/screens/main_danso_chartlist_screen.dart';
import 'package:project_danso/screens/screens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final SongController songController = Get.put(SongController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: Text('한번 더 누르면 앱이 종료됩니다.'),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  topImage(),
                  myPage(),
                ],
              ),
              SizedBox(height: 29.h),
              _homeMenuButton(
                  title: '단소 알아보기',
                  contant: LOOK,
                  page: MainDansoHistoryKindScreen()),
              _homeMenuButton(
                  title: '운지법 익히기',
                  page: learningDialog(),
                  contant: LEARN,
                  dialog: true),
              _homeMenuButton(
                  title: '연주곡 익히기',
                  contant: PLAYLEARN,
                  page: MainDansoChartlistScreen()),
              _homeMenuButton(
                  title: '질문하기',
                  contant: QUESTIONS,
                  page: MainDansoHistoryKindScreen()),
            ],
          ),
        ),
      ),
    );
  }

  Container topImage() {
    return Container(
      color: appBarColor,
      height: 257.h,
      width: ScreenUtil().screenWidth,
      // decoration: BoxDecoration( // 타원모양시도 해보았으나 별루임
      //     color: Color(0xffA5A5A5),
      //     borderRadius:
      //         BorderRadius.vertical(bottom: Radius.elliptical(200, 45))),
      child: Center(
        child: Text('상단 이미지??', style: TextStyle(color: white)),
      ),
    );
  }

  Positioned myPage() {
    return Positioned(
      top: 200.h,
      right: 140.w,
      child: InkWell(
        onTap: () => Get.to(MyPageScreen()),
        child: Container(
          child: Center(
            child: Text(
              '마이페이지',
              style: TextStyle(color: white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _homeMenuButton(
      {required String title,
      required Widget page,
      required String contant,
      Image? image,
      bool dialog = false}) {
    return InkWell(
      onTap: () {
        if (dialog) {
          Get.dialog(page);
        } else {
          Get.to(page);
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 106.h,
        width: 330.w,
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  radius: 39,
                  child: Text('아이콘영역')),
              SizedBox(width: 14.w),
              Container(
                width: 190.w,
                height: 80.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$title',
                        style: TextStyle(
                            fontSize: textTitleSize.sp,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 7.h),
                    Text(contant, style: TextStyle(fontSize: 14.sp))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
