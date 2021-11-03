import 'package:danso_function/danso_function.dart';
import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget jungganboFromLevel(String level) {
  JungGanBo testJungGanBo = new JungGanBo("도라지타령", "세마치장단", level);
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var i = 36; i < 48; i++)
            Row(
              children: [
                jungContainer(
                    testJungGanBo.sheet[i].yulmyeongs[0].toChineseCharacter()),
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
                jungContainer(
                    testJungGanBo.sheet[i].yulmyeongs[0].toChineseCharacter()),
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
                jungContainer(
                    testJungGanBo.sheet[i].yulmyeongs[0].toChineseCharacter()),
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
                jungContainer(
                    testJungGanBo.sheet[i].yulmyeongs[0].toChineseCharacter()),
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
      color: white,
      border: Border.all(color: textBlack),
    ),
  );
}

Container jungContainer(String sa) {
  return Container(
    width: jungWidth.w,
    height: jungHeight.h,
    decoration:
        BoxDecoration(color: white, border: Border.all(color: textBlack)),
    child: Center(
        child: Text(
      sa,
      style: TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
    )),
  );
}
