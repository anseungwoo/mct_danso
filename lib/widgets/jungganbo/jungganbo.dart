import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:danso_function/danso_function.dart';

Widget jungganbo(int heightNumber, JungGanBo testJungGanBo) {
  double height = heightNumber == 12
      ? jungHeight
      : heightNumber == 8
          ? jungEightHeight
          : jungSixHeight;
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = heightNumber * 3; i < heightNumber * 4; i++)
            Row(
              children: [
                jungContainer(height, testJungGanBo, i, heightNumber),
                beenContainer(height),
              ],
            ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = heightNumber * 2; i < heightNumber * 3; i++)
            Row(
              children: [
                jungContainer(height, testJungGanBo, i, heightNumber),
                beenContainer(height),
              ],
            ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = heightNumber; i < heightNumber * 2; i++)
            Row(
              children: [
                jungContainer(height, testJungGanBo, i, heightNumber),
                beenContainer(height),
              ],
            ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < heightNumber; i++)
            Row(
              children: [
                jungContainer(height, testJungGanBo, i, heightNumber),
                beenContainer(height),
              ],
            ),
        ],
      ),
    ],
  );
}

Container beenContainer(double height) {
  return Container(
    width: 20.w,
    height: height.h,
    decoration:
        BoxDecoration(color: white, border: Border.all(color: textBlack)),
  );
}

Container jungContainer(
    double height, JungGanBo testJungGanBo, int i, int heightNumber) {
  return Container(
    width: jungWidth.w,
    height: height.h,
    decoration:
        BoxDecoration(color: white, border: Border.all(color: textBlack)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var j = 0; j < testJungGanBo.sheet[i].yulmyeongs.length; j++)
          Center(
              child: Text(
            testJungGanBo.sheet[i].yulmyeongs[j].toChineseCharacter(),
            style: TextStyle(fontSize: heightNumber == 12 ? 25.sp : 14.sp),
          ))
      ],
    ),
  );
}
