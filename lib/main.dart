import 'dart:ffi';

import 'package:camera/camera.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';

import 'screens/screens.dart';
import 'package:danso_function/danso_function.dart';

List<CameraDescription> cameras;

Future<Void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  PitchModel pitchModel;
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
            home: SplashScreen.navigate(
              name: 'intro',
              next: (context) => Home(),
              until: () => Future.delayed(Duration(seconds: 5)),
              startAnimation: '1',
            ),
          );
        });
  }
}
