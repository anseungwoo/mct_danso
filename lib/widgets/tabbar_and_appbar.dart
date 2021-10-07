import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget tabbarAndAppBar(
    {required String title,
    required TabBar? tabbar,
    bool enableTabBar = true}) {
  return AppBar(
    title: Text(
      '$title',
      style: TextStyle(color: Colors.white, fontSize: 14.sp),
    ),
    centerTitle: true,
    elevation: 1,
    backgroundColor: Color(0xffA5A5A5),
    bottom: enableTabBar
        ? PreferredSize(
            preferredSize: tabbar!.preferredSize,
            child: ColoredBox(
              color: Color(0xffECECEC),
              child: tabbar,
            ),
          )
        : null,
  );
}
