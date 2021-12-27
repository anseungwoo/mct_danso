import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget confirmCancelDialog(String assetName, String text) {
  return WillPopScope(
    onWillPop: () async => false,
    child: Dialog(
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
                color: MctColor.unButtonColorOrange.getMctColor,
              ),
            ),
            Text(
              text,
              style: TextStyle(fontSize: MctSize.fifteen.getSize.sp),
            ),
            SizedBox(height: 30.h),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  '확인',
                  style: TextStyle(
                      color: MctColor.black.getMctColor,
                      fontSize: MctSize.fourteen.getSize.sp),
                ))
          ],
        ),
      ),
    ),
  );
}
