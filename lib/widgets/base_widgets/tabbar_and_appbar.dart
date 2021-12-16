import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/color.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/screens/main_screen.dart';

PreferredSizeWidget tabbarAndAppBar(
    {required String title, TabBar? tabbar, bool enableTabBar = true}) {
  var controller = Get.find<MainScreenController>();
  return AppBar(
    title: Text(
      '$title',
      style: TextStyle(
          color: Colors.white,
          fontSize: textBasicSize.sp,
          fontFamily: NOTO_MEDIUM),
    ),
    centerTitle: true,
    elevation: 1,
    backgroundColor: appBarColor,
    leading: IconButton(
      splashRadius: 15,
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Get.back();
      },
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(basicPadding),
        child: InkWell(
            onTap: () {
              Get.off(MainScreen());
              if (controller.musicState) {
                controller.assetsAudioPlayer.play();
              }
              ;
              // Navigator.of(Get.context!)
              //     .push(MaterialPageRoute(builder: (_) => MainScreen()));
            },
            child: SvgPicture.asset(
              HOME_SVG,
            )),
      ),
    ],
    bottom: enableTabBar
        ? PreferredSize(
            preferredSize: tabbar!.preferredSize,
            child: ColoredBox(
              color: MctColor.indiDarkGray.getMctColor,
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
          color: textBlack,
          fontSize: 23.sp,
          fontWeight: FontWeight.bold,
          fontFamily: NOTO_REGULAR),
    ),
    iconTheme: IconThemeData(color: textBlack),
    centerTitle: true,
    elevation: 0,
    backgroundColor: MctColor.indiDarkGray.getMctColor,
    leading: IconButton(
      splashRadius: 15,
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Get.back();
      },
    ),
  );
}
