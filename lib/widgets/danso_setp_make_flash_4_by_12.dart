import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget jungganboFromLevelFlash(controller) {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var i = 36; i < 48; i++)
            Row(
              children: [
                jungContainer(controller.flashcount, i),
                blackContainer(),
              ],
            ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var i = 24; i < 36; i++)
            Row(
              children: [
                jungContainer(controller.flashcount, i),
                blackContainer(),
              ],
            ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var i = 12; i < 24; i++)
            Row(
              children: [
                jungContainer(controller.flashcount, i),
                blackContainer(),
              ],
            ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var i = 0; i < 12; i++)
            Row(
              children: [
                jungContainer(controller.flashcount, i),
                blackContainer(),
              ],
            ),
        ],
      ),
    ],
  );
}

Container blackContainer() {
  return Container(
    width: 20.w,
    height: jungHeight.h,
    decoration: BoxDecoration(
      border: Border.all(color: textBlack),
    ),
  );
}

Container jungContainer(int a, int i) {
  return Container(
    width: jungWidth.w,
    height: jungHeight.h,
    decoration: BoxDecoration(
        color: a == i ? Colors.black : null,
        border: Border.all(color: textBlack)),
  );
}
