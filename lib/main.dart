import 'dart:ffi';
import 'package:camera/camera.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

List<CameraDescription>? cameras;

Future<Void?> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
  // runApp(MyApp());
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
            locale: DevicePreview.locale(context),
            title: 'Flutter Demo',
            theme: ThemeData(
              // textTheme: GoogleFonts.latoTextTheme(
              //   Theme.of(context).textTheme,
              // ),

              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              scaffoldBackgroundColor: background, // 기본 배경색
            ),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        });
  }
}
