import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/utils/danso_function.dart';

Widget fingering(BuildContext context) {
  final Yum = [
    YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin),
    YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin),
    YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin),
    YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin),
    YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin),
    YulmyeongNote(Yulmyeong.tae, ScaleStatus.high),
  ];
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: leftRightText(),
      ),
      Expanded(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (var i = 0; i < 6; i++)
                      Text(
                        '${Yum[i].toChineseCharacter()}',
                        style: TextStyle(
                          fontSize: MctSize.twenty.getSize.sp,
                          fontFamily: NOTO_REGULAR,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (var i = 0; i < 5; i++)
                      Text(
                        '${Yum[i].toHangeul()}',
                        style: TextStyle(
                          fontSize: MctSize.twenty.getSize.sp,
                          fontFamily: NOTO_REGULAR,
                        ),
                      ),
                    Text(
                      '태',
                      style: TextStyle(
                        fontSize: MctSize.twenty.getSize.sp,
                        fontFamily: NOTO_REGULAR,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (var i = 0; i < 6; i++)
                      SvgPicture.asset(
                        DANSO_CODE_SVG_LIST[i],
                        height: ScreenUtil().screenWidth * 0.9,
                        fit: BoxFit.fitHeight,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Row leftRightText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      CircleAvatar(
          radius: 14.r, backgroundColor: MctColor.rightHandColor.getMctColor),
      SizedBox(
        width: 7.sp,
      ),
      Text(
        '왼손',
        style: TextStyle(
          fontSize: 15.sp,
          fontFamily: NOTO_REGULAR,
        ),
      ),
      SizedBox(
        width: 7.sp,
      ),
      CircleAvatar(
          radius: 14.r, backgroundColor: MctColor.leftHandColor.getMctColor),
      SizedBox(width: 7.sp),
      Text(
        '오른손',
        style: TextStyle(
          fontSize: 15.sp,
          fontFamily: NOTO_REGULAR,
        ),
      ),
    ],
  );
}
