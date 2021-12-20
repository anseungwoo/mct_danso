import 'package:flutter/material.dart';
import 'package:project_danso/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/utils/danso_function.dart';

Widget jungganbo(int heightNumber, JungganboController controller,
    JungGanBo testJungGanBo, bool krState) {
  double height;
  if (heightNumber == 12) {
    height = MctSize.jungHeight.getSize;
  } else {
    height = heightNumber == 8
        ? MctSize.jungEightHeight.getSize
        : MctSize.jungSixHeight.getSize;
  }
  var j = 0;
  return Row(
    // mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.end,
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
    decoration: BoxDecoration(
        color: MctColor.white.getMctColor,
        border: Border.all(color: MctColor.white.getMctColor)),
  );
}

Widget jungContainer(double height, JungganboController controller, int i,
    int j, int heightNumber, JungGanBo testJungGanBo, bool krState) {
  return Center(
    child: Container(
      width: MctSize.jungWidth.getSize.w,
      height: height.h,
      decoration: BoxDecoration(
          color: MctColor.white.getMctColor,
          border: Border.all(color: MctColor.white.getMctColor)),
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
        fontSize: heightNumber == 12
            ? MctSize.eighteen.getSize.sp
            : MctSize.fourteen.getSize.sp,
        color: controller.isChallenge
            ? controller.matchTrueFalse[i][j]
                ? Colors.blue
                : Colors.red
            : MctColor.black.getMctColor),
  );
}
