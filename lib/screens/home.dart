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
            Container(
              height: 257.77.h,
              width: ScreenUtil().screenWidth,
              color: Color(0xffA5A5A5),
              child: Center(
                child: Text('상단 이미지'),
              ),
            ),
            SizedBox(height: 29.h),
            _homeMenuButton(title: '단소 알아보기', page: HomeMenu1()),
            _homeMenuButton(title: '운지법 익히기', page: HomeMenu2()),
            _homeMenuButton(title: '연주곡 익히기', page: HomeMenu1()),
            _homeMenuButton(title: '질문하기', page: HomeMenu1()),
          ],
        ),
      ),
    );
  }

  Widget _homeMenuButton({required String title, required Widget page}) {
    return InkWell(
      onTap: () => Get.to(page),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 106.h,
        width: 330.w,
        color: Colors.white,
        child: Center(
          child: Text('$title'),
        ),
      ),
    );
  }
}
