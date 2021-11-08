import 'package:danso_function/model/jung-gan-bo_model/JungGanBo.dart';
import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget jungganbo(
    int heightNumber, controller, JungGanBo testJungGanBo, bool krState) {
  double height = heightNumber == 12
      ? jungHeight
      : heightNumber == 8
          ? jungEightHeight
          : jungSixHeight;
  int j = 0;
  return Row(
    children: [
      for (var c = 3; c >= 0; c--)
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (var i = heightNumber * c; i < heightNumber * (c + 1); i++)
              Row(
                children: [
                  testJungGanBo.sheet[i].yulmyeongs.length == 1
                      ? jungContainer(height, controller.flashcount, i, j,
                          heightNumber, testJungGanBo, krState)
                      : testJungGanBo.sheet[i].yulmyeongs.length == 2
                          ? Column(
                              children: [
                                for (var j = 0; j < 2; j++)
                                  jungContainer(
                                      height / 2,
                                      controller.flashcount,
                                      i,
                                      j,
                                      heightNumber,
                                      testJungGanBo,
                                      krState)
                              ],
                            )
                          : testJungGanBo.sheet[i].yulmyeongs.length == 3
                              ? Column(
                                  children: [
                                    for (var j = 0; j < 3; j++)
                                      jungContainer(
                                          height / 3,
                                          controller.flashcount,
                                          i,
                                          j,
                                          heightNumber,
                                          testJungGanBo,
                                          krState)
                                  ],
                                )
                              : Container(),
                  blankContainer(height),
                ],
              ),
          ],
        ),
    ],
  );
}

Container blankContainer(double height) {
  return Container(
    width: 20.w,
    height: height.h,
    decoration: BoxDecoration(color: white, border: Border.all(color: white)),
  );
}

Container jungContainer(double height, int a, int i, int j, int heightNumber,
    JungGanBo testJungGanBo, bool krState) {
  return Container(
    width: jungWidth.w,
    height: height.h,
    decoration: BoxDecoration(color: white, border: Border.all(color: white)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: krState
              ? Text(
                  testJungGanBo.sheet[i].yulmyeongs[j].toChineseCharacter(),
                  style:
                      TextStyle(fontSize: heightNumber == 12 ? 18.sp : 14.sp),
                )
              : Text(
                  testJungGanBo.sheet[i].yulmyeongs[j].toHangeul(),
                  style:
                      TextStyle(fontSize: heightNumber == 12 ? 18.sp : 14.sp),
                ),
        ),
      ],
    ),
  );
}
