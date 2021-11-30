import 'package:danso_function/model/jung-gan-bo_model/JungGanBo.dart';
import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/controllers/jungganbo_controller.dart';

Widget jungganbo(int heightNumber, JungganboController controller,
    JungGanBo testJungGanBo, bool krState) {
  double height = heightNumber == 12
      ? jungHeight
      : heightNumber == 8
          ? jungEightHeight
          : jungSixHeight;
  int j = 0;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for (var c = 3 + controller.next2; c >= 0 + controller.next; c--)
        Column(
          children: [
            for (var i = heightNumber * c; i < heightNumber * (c + 1); i++)
              Row(
                children: [
                  testJungGanBo.sheet[i].yulmyeongs.length == 1
                      ? jungContainer(height, controller, i, j, heightNumber,
                          testJungGanBo, krState)
                      : testJungGanBo.sheet[i].yulmyeongs.length == 2
                          ? Column(
                              children: [
                                for (var j = 0; j < 2; j++)
                                  jungContainer(height / 2, controller, i, j,
                                      heightNumber, testJungGanBo, krState)
                              ],
                            )
                          : testJungGanBo.sheet[i].yulmyeongs.length == 3
                              ? Column(
                                  children: [
                                    for (var j = 0; j < 3; j++)
                                      jungContainer(
                                          height / 3,
                                          controller,
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

Widget jungContainer(double height, JungganboController controller, int i,
    int j, int heightNumber, JungGanBo testJungGanBo, bool krState) {
  return Center(
    child: Container(
      width: jungWidth.w,
      height: height.h,
      decoration: BoxDecoration(color: white, border: Border.all(color: white)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: krState
                  ? changeTextColor(
                      testJungGanBo,
                      i,
                      j,
                      heightNumber,
                      controller,
                      testJungGanBo.sheet[i].yulmyeongs[j].toChineseCharacter())
                  : changeTextColor(
                      testJungGanBo,
                      i,
                      j,
                      heightNumber,
                      controller,
                      testJungGanBo.sheet[i].yulmyeongs[j].toHangeul())),
        ],
      ),
    ),
  );
}

Widget changeTextColor(JungGanBo testJungGanBo, int i, int j, int heightNumber,
    JungganboController controller, String text) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: NOTO_REGULAR,
        fontSize: heightNumber == 12 ? textEightSize.sp : textBasicSize.sp,
        color: controller.line == i && controller.jungSection == j
            ? controller.gameState
                ? Colors.blue
                : Colors.red
            : Colors.black),
  );
}
