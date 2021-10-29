import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/screens/screens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/widgets/widgets.dart';

Widget learningDialog() {
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
                fontSize: textTitleSize.sp,
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
              icon(text: "단소 학습 익히기", page: MainDansoLearningScreen()),
              SizedBox(
                width: 14.w,
              ),
              icon(page: MainDansoLearningTestScreen(), text: "단계별 연습"),
            ],
          ),
        ],
      ),
    ),
  );
}
