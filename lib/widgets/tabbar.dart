import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/const.dart';

TabBar defaultTabBar({@required List<Tab> tabList, bool scrollable = false}) {
  return TabBar(
    isScrollable: scrollable,
    tabs: tabList,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        width: 1.5,
        color: tapBarColor,
      ),
      insets: EdgeInsets.symmetric(horizontal: 15.0),
    ),
    unselectedLabelColor: Color(0xffBFBFBF),
    labelColor: tapBarColor,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.sp,
    ),
  );
}
