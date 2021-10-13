import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget defaultAppBar({@required String title}) {
  return AppBar(
    title: Text(
      '$title',
      style: TextStyle(color: Colors.white, fontSize: 14.sp),
    ),
    elevation: 1,
    backgroundColor: Color(0xffA5A5A5),
  );
}
