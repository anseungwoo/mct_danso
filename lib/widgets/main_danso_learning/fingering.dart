import 'package:camera/camera.dart';
import 'package:danso_function/common/classes/YulmyeongNote.dart';
import 'package:danso_function/common/constants/PitchConst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_danso/common/const.dart';

Widget fingering(BuildContext context) {
  final List Yum = [
    YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin),
    YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin),
    YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin),
    YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin),
    YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin),
  ];
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(radius: 14.r, backgroundColor: Colors.black),
            SizedBox(
              width: 7.sp,
            ),
            Text('왼손', style: TextStyle(fontSize: 15.sp)),
            SizedBox(
              width: 7.sp,
            ),
            CircleAvatar(radius: 14.r, backgroundColor: leftColor),
            SizedBox(width: 7.sp),
            Text('오른손', style: TextStyle(fontSize: 15.sp)),
          ],
        ),
      ),
      dansoyun(Yum, false, true),
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        child: dansoyun(Yum, true, true),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: dansoyun(Yum, true, false),
      ),
    ],
  );
}

Container dansoyun(List<dynamic> Yum, bool kr, bool textState) {
  return Container(
    width: ScreenUtil().screenWidth.w,
    child: Row(
      mainAxisAlignment: textState
          ? MainAxisAlignment.spaceAround
          : MainAxisAlignment.spaceEvenly,
      children: [
        for (var i = 0; i < 5; i++)
          textState
              ? Text(
                  kr
                      ? '${Yum[i].toHangeul()}'
                      : '${Yum[i].toChineseCharacter()}',
                  style: TextStyle(
                    fontSize: textTitleSize.sp,
                  ))
              : Container(
                  height: 320.h, child: SvgPicture.asset(DANSO_SVG_LIST[i])),
      ],
    ),
  );
}
