import 'package:danso_function/model/jung-gan-bo_model/JungGanBo.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:project_danso/common/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget jungganboFromFlash(
    int heightNumber, controller, JungGanBo testJungGanBo) {
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
                      ? jungFlashContainer(
                          height, controller, i, j, heightNumber)
                      : testJungGanBo.sheet[i].yulmyeongs.length == 2
                          ? Column(
                              children: [
                                for (var j = 0; j < 2; j++)
                                  jungFlashContainer(height / 2, controller, i,
                                      j, heightNumber)
                              ],
                            )
                          : testJungGanBo.sheet[i].yulmyeongs.length == 3
                              ? Column(
                                  children: [
                                    for (var j = 0; j < 3; j++)
                                      jungFlashContainer(height / 3, controller,
                                          i, j, heightNumber)
                                  ],
                                )
                              : Container(),
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
  );
}

Container jungFlashContainer(
    double height, controller, int i, int j, int heightNumber) {
  return Container(
    width: jungWidth.w,
    height: height.h,
    decoration: BoxDecoration(
      color: controller.i == i && controller.j == j
          ? Colors.blue[100]!.withOpacity(0.5)
          : null,
    ),
  );
}
