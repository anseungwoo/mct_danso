import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/screens/main_screen.dart';

PreferredSizeWidget tabbarAndAppBar(
    {@required String title,
    @required TabBar tabbar,
    bool enableTabBar = true}) {
  return AppBar(
    title: Text(
      '$title',
      style: TextStyle(color: Colors.white, fontSize: textBasicSize.sp),
    ),
    centerTitle: true,
    elevation: 1,
    backgroundColor: appBarColor,
    actions: [
      IconButton(
          icon: Icon(Icons.home_filled),
          onPressed: () {
            Get.offAll(MainScreen());
          })
    ],
    bottom: enableTabBar
        ? PreferredSize(
            preferredSize: tabbar.preferredSize,
            child: ColoredBox(
              color: background,
              child: tabbar,
            ),
          )
        : null,
  );
}

PreferredSizeWidget songtabbarAndAppBar(
    {@required String title,
    @required TabBar tabbar,
    bool enableTabBar = true}) {
  return AppBar(
    title: Text(
      '$title',
      style: TextStyle(
          color: textBlack, fontSize: 23.sp, fontWeight: FontWeight.bold),
    ),
    iconTheme: IconThemeData(color: textBlack),
    centerTitle: true,
    elevation: 0,
    backgroundColor: background,
    bottom: enableTabBar
        ? PreferredSize(
            preferredSize: tabbar.preferredSize,
            child: ColoredBox(
              color: background,
              child: tabbar,
            ),
          )
        : null,
  );
}
