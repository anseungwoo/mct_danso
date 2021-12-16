import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/color.dart';
import 'package:project_danso/common/contant.dart';
import 'package:project_danso/common/size.dart';

PreferredSizeWidget defaultAppBar({required String title}) {
  return AppBar(
    title: Text(
      '$title',
      style: TextStyle(
          color: MctColor.white.getMctColor,
          fontSize: MctSize.fourteen.getSize.sp),
    ),
    elevation: 1,
    backgroundColor: MctColor.indiDarkGray.getMctColor,
  );
}
