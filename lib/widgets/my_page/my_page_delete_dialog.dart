import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';

Widget myPageDeleteDialog() {
  return Dialog(
    insetPadding: EdgeInsets.zero,
    child: GetBuilder<MyPageController>(
        init: MyPageController(),
        builder: (controller) {
          return Container(
            width: 330.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(42),
                  child: Text(
                    '삭제하겠습니까?',
                    style: TextStyle(fontSize: textEightSize.sp),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    yesNoButton("취소"),
                    yesNoButton("확인"),
                  ],
                )
              ],
            ),
          );
        }),
  );
}

Padding yesNoButton(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
    child: TextButton(
      child: Text(
        text,
        style: TextStyle(color: textBlack, fontSize: textFiveSize.sp),
      ),
      onPressed: () {
        Get.back();
      },
    ),
  );
}
