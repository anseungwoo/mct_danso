import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_danso/screens/home_menu_2.dart';
import 'package:project_danso/screens/screens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget learningdirlog() {
  return Dialog(
    insetPadding: EdgeInsets.zero,
    child: Container(
      height: 278.h,
      width: 330.w,
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Text(
              '운지법 익히기',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 17.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(text: "단소 연습 익히기", page: HomeMenu2()),
              SizedBox(
                width: 14.w,
              ),
              Icon(page: HomeMenu1(), text: "단계별 연습"),
            ],
          ),
        ],
      ),
    ),
  );
}

Column Icon({required String text, required Widget page}) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          Get.to(page);
        },
        child: Container(
          width: 140.w,
          height: 140.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), //모서리를 둥글게
              border: Border.all(color: Colors.black12, width: 1)),
          child: Center(child: Text("아이콘 영역")),
        ),
      ),
      SizedBox(height: 16.h),
      Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
      ),
    ],
  );
}
