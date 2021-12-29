import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/common.dart';

TabBar defaultTabBar({required List<Tab> tabList, bool scrollable = false}) {
  return TabBar(
    isScrollable: scrollable,
    tabs: tabList,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        width: 1.0,
        color: MctColor.buttonColorOrange.getMctColor,
      ),
      insets: EdgeInsets.symmetric(horizontal: MctSize.fifteen.getSize),
    ),
    unselectedLabelColor: MctColor.unSelecttapBarColor.getMctColor,
    labelColor: MctColor.tapBarColor.getMctColor,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: MctSize.eighteen.getSize.sp,
    ),
  );
}

Tab TabText(String text) {
  return Tab(
    text: text,
  );
}
