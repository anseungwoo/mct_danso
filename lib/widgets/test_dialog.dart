import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget testDialog(String assetName, String text) {
  return Dialog(
    insetPadding: EdgeInsets.zero,
    child: Container(
      // height: 210.h,
      width: 330.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: SvgPicture.asset(
              assetName,
              width: 60.w,
              height: 60.h,
              color: unButtonColorOrang,
            ),
          ),
          Text(
            text,
            style: TextStyle(fontSize: textFiveSize.sp),
          ),
          SizedBox(height: 30.h),
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(

                "확인",
                style: TextStyle(color: textBlack, fontSize: textBasicSize.sp),

              ))
        ],
      ),
    ),
  );
}
