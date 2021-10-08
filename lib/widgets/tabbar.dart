import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TabBar defaultTabBar({required List<Tab> tabList, bool scrollable = false}) {
  return TabBar(
    isScrollable: scrollable,
    tabs: tabList,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        width: 1.5,
        color: Color(0xff707070),
      ),
      insets: EdgeInsets.symmetric(horizontal: 15.0),
    ),
    unselectedLabelColor: Color(0xffBFBFBF),
    labelColor: Color(0xff636363),
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.sp,
    ),
  );
}
