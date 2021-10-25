import 'dart:ffi';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:splashscreen/splashscreen.dart';
import 'screens/screens.dart';

List<CameraDescription> cameras;

Future<Void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return ScreenUtilInit(
        designSize: Size(360, 640),
        builder: () {
          return GetMaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              scaffoldBackgroundColor: background, // 기본 배경색
            ),
            home: logoSplash(),
          );
        });
  }

  SplashScreen logoSplash() {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: MainScreen(),
      title:
          Text("단소가불고싶니?~~~", style: TextStyle(fontSize: 30, color: textBlack)),
      image: Image.asset("assets/images/images.png"),
      backgroundColor: background,
      photoSize: ScreenUtil().screenWidth * 0.4,
      loaderColor: Colors.brown,
      loadingText: Text("들어가는중입니다."),
    );
  }
}
