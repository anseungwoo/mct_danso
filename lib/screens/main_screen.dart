import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/screens/screens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/widgets/loading_indicator.dart';
import 'package:project_danso/widgets/timer_widget.dart';
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
                  topImage(context),
                  myPage(),
                ],
              ),
              _homeMenuButton(
                  assetName: INFOR_SVG,
                  title: '단소 알아보기',
                  contant: LOOK,
                  page: MainDansoHistoryKindScreen()),
              _homeMenuButton(
                  assetName: DANSO_TUNING_SVG,
                  title: '내 단소 기준음 잡기',
                  contant: VOLUMECONTROL,
                  page: mainDansoCautionDialog(),
                  dialog: true),
              _homeMenuButton(
                  assetName: STUDY_SVG,
                  title: '운지법 익히기',
                  page: learningDialog(),
                  contant: LEARN,
                  dialog: true),
              _homeMenuButton(
                  assetName: TUNE_SVG,
                  title: '연주곡 익히기',
                  contant: PLAYLEARN,
                  page: MainDansoChartlistScreen()),
              _homeMenuButton(
                  assetName: QandA_SVG,
                  title: 'Q&A',
                  contant: QUESTIONS,
                  page: QuestionsScreen()),
            ],
          ),
        ),
      ),
    );
  }

  Container topImage(BuildContext context) {
    return Container(
        height: 250.h,
        width: ScreenUtil().screenWidth,
        child: ClipPath(
            clipper: MyClipper(),
            child: Container(
              margin: EdgeInsets.only(bottom: 0),
              height: ScreenUtil().screenHeight * 0.1,
              width: double.infinity,
              decoration: BoxDecoration(
                color: appBarColor,
              ),
            )));
  }
  // 기존 타이틀
  // Container topImage() {
  //   return Container(
  //     color: appBarColor,
  //     height: 257.h,
  //     width: ScreenUtil().screenWidth,
  //     child: Center(
  //       child: Text('상단 이미지??', style: TextStyle(color: white)),
  //     ),
  //   );
  // }

  Positioned myPage() {
    return Positioned(
      top: 150.h,
      right: 150.w,
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
      required String assetName,
      bool dialog = false,
      Function()? onPressed}) {
    return InkWell(
      onTap: () {
        onPressed;
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
              SvgPicture.asset(assetName),
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

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 40.h);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
