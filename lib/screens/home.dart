import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/screens/screens.dart';
import 'package:project_danso/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 257.77.h,
                  width: ScreenUtil().screenWidth,
                  color: Color(0xffA5A5A5),
                  child: Center(
                    child: Text('상단 이미지', style: TextStyle()),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 30,
                  child: InkWell(
                    onTap: () => Get.to(MyPage()),
                    child: Container(
                      child: Center(
                        child: Text('마이\n페이지'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 29.h),
            _homeMenuButton(title: '단소 알아보기', contant: LOOK, page: HomeMenu1()),
            _homeMenuButton(
                title: '운지법 익히기',
                page: learningDialog(),
                contant: LEARN,
                dialog: true),
            _homeMenuButton(
                title: '연주곡 익히기', contant: PLAYLEARN, page: HomeMenu1()),
            _homeMenuButton(
                title: '질문하기', contant: QUESTIONS, page: HomeMenu1()),
          ],
        ),
      ),
    );
  }

  Widget _homeMenuButton(
      {required String title,
      required Widget page,
      required String contant,
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
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  radius: 39,
                  child: Text("아이콘영역")),
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
                            fontSize: 20.sp, fontWeight: FontWeight.bold)),
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
