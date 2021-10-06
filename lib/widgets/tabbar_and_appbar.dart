import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget tabbarAndAppBar(
    {required String title, required TabBar tabbar}) {
  return AppBar(
    title: Text(
      '$title',
      style: TextStyle(color: Colors.white, fontSize: 14.sp),
    ),
    elevation: 1,
    backgroundColor: Color(0xffA5A5A5),
    bottom: PreferredSize(
      preferredSize: tabbar.preferredSize,
      child: ColoredBox(
        color: Color(0xffECECEC),
        child: tabbar,
      ),
    ),
  );
}
