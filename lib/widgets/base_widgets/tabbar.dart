import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project_danso/common/const.dart';

TabBar defaultTabBar({required List<Tab> tabList, bool scrollable = false}) {
  return TabBar(
    isScrollable: scrollable,
    tabs: tabList,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        width: 1.0,
        color: buttonColorOrang,
      ),
      insets: EdgeInsets.symmetric(horizontal: basicPadding),
    ),
    unselectedLabelColor: unSelectColor,
    labelColor: tapBarColor,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: textEightSize.sp,
    ),
  );
}

Tab TabText(String text) {
  return Tab(
    text: text,
    // height: 30.h,
  );
}
