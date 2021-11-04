import 'package:danso_function/model/jung-gan-bo_model/JungGanBo.dart';
import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget jungganboFromFlash(
    double height, int heightNumber, controller, JungGanBo testJungGanBo) {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var i = heightNumber * 3; i < heightNumber * 4; i++)
            Row(
              children: [
                testJungGanBo.sheet[i].yulmyeongs.length == 1
                    ? jungContainer(height, controller.flashcount, i)
                    : testJungGanBo.sheet[i].yulmyeongs.length == 2
                        ? Row(
                            children: [
                              for (var j = 0; j < 2; j++)
                                jungContainer(
                                    height / 2, controller.flashcount, j)
                            ],
                          )
                        : testJungGanBo.sheet[i].yulmyeongs.length == 3
                            ? Row(
                                children: [
                                  for (var j = 0; j < 3; j++)
                                    jungContainer(
                                        height / 3, controller.flashcount, j)
                                ],
                              )
                            : Container(),
                beenContainer(height),
              ],
            ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var i = heightNumber * 2; i < heightNumber * 3; i++)
            Row(
              children: [
                testJungGanBo.sheet[i].yulmyeongs.length == 1
                    ? jungContainer(height, controller.flashcount, i)
                    : testJungGanBo.sheet[i].yulmyeongs.length == 2
                        ? Row(
                            children: [
                              for (var j = 0; j < 2; j++)
                                jungContainer(
                                    height / 2, controller.flashcount, j)
                            ],
                          )
                        : testJungGanBo.sheet[i].yulmyeongs.length == 3
                            ? Row(
                                children: [
                                  for (var j = 0; j < 3; j++)
                                    jungContainer(
                                        height / 3, controller.flashcount, j)
                                ],
                              )
                            : Container(),
                beenContainer(height),
              ],
            ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var i = heightNumber; i < heightNumber * 2; i++)
            Row(
              children: [
                testJungGanBo.sheet[i].yulmyeongs.length == 1
                    ? jungContainer(height, controller.flashcount, i)
                    : testJungGanBo.sheet[i].yulmyeongs.length == 2
                        ? Row(
                            children: [
                              for (var j = 0; j < 2; j++)
                                jungContainer(
                                    height / 2, controller.flashcount, j)
                            ],
                          )
                        : testJungGanBo.sheet[i].yulmyeongs.length == 3
                            ? Row(
                                children: [
                                  for (var j = 0; j < 3; j++)
                                    jungContainer(
                                        height / 3, controller.flashcount, j)
                                ],
                              )
                            : Container(),
                beenContainer(height),
              ],
            ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var i = 0; i < heightNumber; i++)
            Row(
              children: [
                testJungGanBo.sheet[i].yulmyeongs.length == 1
                    ? jungContainer(height, controller.flashcount, i)
                    : testJungGanBo.sheet[i].yulmyeongs.length == 2
                        ? Row(
                            children: [
                              for (var j = 0;
                                  j < testJungGanBo.sheet[i].yulmyeongs.length;
                                  j++)
                                jungContainer(
                                    height /
                                        testJungGanBo
                                            .sheet[i].yulmyeongs.length,
                                    controller.flashcount,
                                    j)
                            ],
                          )
                        : testJungGanBo.sheet[i].yulmyeongs.length == 3
                            ? Row(
                                children: [
                                  for (var j = 0;
                                      j <
                                          testJungGanBo
                                              .sheet[i].yulmyeongs.length;
                                      j++)
                                    jungContainer(
                                        height /
                                            testJungGanBo
                                                .sheet[i].yulmyeongs.length,
                                        controller.flashcount,
                                        j)
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
    decoration:
        BoxDecoration(color: white, border: Border.all(color: textBlack)),
  );
}

Container jungContainer(double height, int a, int i) {
  return Container(
    width: jungWidth.w,
    height: height.h,
    decoration: BoxDecoration(
        color: a == i ? Colors.black : null,
        border: Border.all(color: textBlack)),
  );
}
