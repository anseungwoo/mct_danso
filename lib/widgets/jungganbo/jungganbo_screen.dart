import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/controllers/jungganbo_controller.dart';

Widget jungganboScreen(int heightNumber, JungganboController controller) {
  double height;
  if (heightNumber == 12) {
    height = jungHeight;
  } else {
    height = heightNumber == 8 ? jungEightHeight : jungSixHeight;
  }

  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        for (var c = 3; c >= 0; c--)
          Column(
            children: [
              for (var i = heightNumber * c; i < heightNumber * (c + 1); i++)
                Row(
                  children: [
                    jungBigContainer(height, controller),
                    jungBlankContainer(height),
                  ],
                ),
            ],
          ),
      ],
    ),
  );
}

Container jungBlankContainer(
  double height,
) {
  return Container(
    width: 20.w,
    height: height.h,
    decoration: BoxDecoration(
      border: Border.all(color: textBlack),
      color: Colors.white,
    ),
  );
}

Widget jungBigContainer(double height, JungganboController controller) {
  return InkWell(
    onTap: () {
      controller.changegameState();
    },
    child: Container(
      width: jungWidth.w,
      height: height.h,
      decoration: BoxDecoration(
        border: Border.all(color: textBlack),
        color: Colors.white,
      ),
    ),
  );
}
