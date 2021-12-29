import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/screens/screens.dart';

PreferredSizeWidget tabbarAndAppBar(
    {required String title, TabBar? tabbar, bool enableTabBar = true}) {
  var controller = Get.find<MainScreenController>();
  return AppBar(
    title: Text(
      '$title',
      style: TextStyle(
          color: Colors.white,
          fontSize: MctSize.fourteen.getSize.sp,
          fontFamily: NOTO_MEDIUM),
    ),
    centerTitle: true,
    elevation: 1,
    backgroundColor: MctColor.appBarColor.getMctColor,
    leading: IconButton(
      splashRadius: 15,
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Get.back();
      },
    ),
    actions: [
      Padding(
        padding: EdgeInsets.all(MctSize.fifteen.getSize),
        child: InkWell(
          onTap: () {
            Get.offAll(HomeScreen());
            if (controller.musicState.value) {
              controller.player.play();
            }
          },
          child: SvgPicture.asset(
            HOME_SVG,
          ),
        ),
      ),
    ],
    bottom: enableTabBar
        ? PreferredSize(
            preferredSize: tabbar!.preferredSize,
            child: ColoredBox(
              color: MctColor.mainBackGround.getMctColor,
              child: tabbar,
            ),
          )
        : null,
  );
}

PreferredSizeWidget songtabbarAndAppBar(
    {required String title, TabBar? tabbar, bool enableTabBar = true}) {
  return AppBar(
    title: Text(
      '$title',
      style: TextStyle(
          color: MctColor.black.getMctColor,
          fontSize: 23.sp,
          fontWeight: FontWeight.bold,
          fontFamily: NOTO_REGULAR),
    ),
    iconTheme: IconThemeData(color: MctColor.black.getMctColor),
    centerTitle: true,
    elevation: 0,
    backgroundColor: MctColor.mainBackGround.getMctColor,
    leading: IconButton(
      splashRadius: 15,
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Get.back();
      },
    ),
  );
}
