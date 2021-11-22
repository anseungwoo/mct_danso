import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/const.dart';

PreferredSizeWidget defaultAppBar({required String title}) {
  return AppBar(
    title: Text(
      '$title',
      style: TextStyle(color: white, fontSize: textBasicSize.sp),
    ),
    elevation: 1,
    backgroundColor: darkGray,
  );
}
