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
      insets: EdgeInsets.symmetric(horizontal: basicPadding),
    ),
    unselectedLabelColor: textHiddenGray,
    labelColor: tapBarColor,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: textStyleSize.sp,
    ),
  );
}
