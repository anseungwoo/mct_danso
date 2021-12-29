import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//도전하기시에 경고문구 담당
Widget challengeCautionDialog() {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          WARNING_SVG,
          width: 60.w,
          height: 60.h,
          color: MctColor.buttonColorYellow.getMctColor,
        ),
        SizedBox(height: 15.h),
        Text(
          '이어폰 착용을 권장합니다.',
          style: TextStyle(
              fontSize: MctSize.seventeen.getSize.sp,
              fontWeight: bold,
              fontFamily: NOTO_BOLD),
        ),
        SizedBox(height: 15.h),
        // Text(
        //   '이어폰 착용을 권장합니다.',
        //   style: TextStyle(fontFamily: NOTO_REGULAR, fontSize: 13.sp),
        // ),
        // SizedBox(height: 15.h),
        Text(
          '장구 소리에 의해 판정이\n올바르지 않을 수 있습니다.',
          style: TextStyle(fontFamily: NOTO_REGULAR, fontSize: 13.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15.h),
        Text(
          '소음이 적은 장소에서 연주해 주세요',
          style: TextStyle(fontFamily: NOTO_REGULAR, fontSize: 13.sp),
        ),
        SizedBox(height: 15.h),
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            '확인',
            style: TextStyle(
                fontFamily: NOTO_REGULAR,
                fontSize: 13.sp,
                color: MctColor.black.getMctColor),
          ),
        ),
      ],
    ),
  );
}
