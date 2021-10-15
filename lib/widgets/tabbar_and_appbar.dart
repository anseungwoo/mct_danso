import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/const.dart';

PreferredSizeWidget tabbarAndAppBar(
    {@required String title,
    @required TabBar tabbar,
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
          color: textBlack, fontSize: 36.sp, fontWeight: FontWeight.bold),
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
