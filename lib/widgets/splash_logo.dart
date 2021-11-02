import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/screens/screens.dart';
import 'package:splashscreen/splashscreen.dart';

SplashScreen splashLogo() {
  return SplashScreen(
    seconds: 3,
    navigateAfterSeconds: MainScreen(),
    title:
        Text('단소가불고싶니?~~~', style: TextStyle(fontSize: 30, color: textBlack)),
    image: Image.asset('assets/images/images.png'),
    backgroundColor: background,
    photoSize: ScreenUtil().screenWidth * 0.4,
    loaderColor: Colors.brown,
    loadingText: Text('들어가는중입니다.'),
  );
}
