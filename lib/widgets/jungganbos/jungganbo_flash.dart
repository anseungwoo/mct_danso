import 'package:flutter/material.dart';
import 'package:project_danso/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/utils/danso_function.dart';

//정간보 애니매이션을 담당
Widget jungganboFromFlash(
    int heightNumber, JungganboController controller, JungGanBo testJungGanBo) {
  double height;
  if (heightNumber == 12) {
    height = MctSize.jungHeight.getSize;
  } else {
    height = heightNumber == 8
        ? MctSize.jungEightHeight.getSize
        : MctSize.jungSixHeight.getSize;
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      for (var c = 3 + controller.next2; c >= 0 + controller.next; c--)
        Column(
          children: [
            for (var i = heightNumber * c; i < heightNumber * (c + 1); i++)
              Row(
                children: [
                  jungFlashContainer(height, controller, i, heightNumber),
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
      border: Border.all(color: MctColor.black.getMctColor),
    ),
  );
}

Container jungFlashContainer(
    double height, JungganboController controller, int i, int heightNumber) {
  return Container(
    width: MctSize.jungWidth.getSize.w,
    height: height.h,
    decoration: BoxDecoration(
      border: Border.all(color: MctColor.black.getMctColor),
      color: controller.line == i ? Colors.red[100]!.withOpacity(0.5) : null,
    ),
  );
}
