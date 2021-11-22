import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/permissioin_controller.dart';
import 'package:project_danso/screens/screens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PermissionController permissionController =
      Get.put(PermissionController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, () async {
      permissionController.permission();
      await Get.off(MainScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: logoColor,
      body: Center(
        child: Container(
          color: logoColor,
          child: SvgPicture.asset(
            LOGO_SVG,
            width: 230.w,
            height: 70.h,
          ),
        ),
      ),
    );
  }
}
