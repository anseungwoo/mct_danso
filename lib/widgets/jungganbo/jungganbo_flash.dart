import 'package:danso_function/model/jung-gan-bo_model/JungGanBo.dart';
import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/controllers/controllers.dart';

Widget jungganboFromFlash(
    int heightNumber, JungganboController controller, JungGanBo testJungGanBo) {
  double height;
  if (heightNumber == 12) {
    height = jungHeight;
  } else {
    height = heightNumber == 8 ? jungEightHeight : jungSixHeight;
  }

  var j = 0;
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      for (var c = 3 + controller.next2; c >= 0 + controller.next; c--)
        Column(
          children: [
            for (var i = heightNumber * c; i < heightNumber * (c + 1); i++)
              Row(
                children: [
                  jungFlashContainer(height, controller, i, j, heightNumber),
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
    decoration: BoxDecoration(
      border: Border.all(color: textBlack),
    ),
  );
}

Container jungFlashContainer(double height, JungganboController controller,
    int i, int j, int heightNumber) {
  return Container(
    width: jungWidth.w,
    height: height.h,
    decoration: BoxDecoration(
      border: Border.all(color: textBlack),
      color: controller.line == i && controller.jungSection == j
          ? Colors.red[100]!.withOpacity(0.5)
          : null,
    ),
  );
}
