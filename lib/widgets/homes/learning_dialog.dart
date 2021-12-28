import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/screens/screens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/widgets/widgets.dart';

final permissionController = Get.put(PermissionController());
Widget learningDialog() {
  permissionController.checkPermission();
  return Dialog(
    insetPadding: EdgeInsets.zero,
    child: Container(
      padding: EdgeInsets.only(
          bottom: MctSize.fifteen.getSize, top: MctSize.fifteen.getSize),
      width: 330.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              '운지법 익히기',
              style: TextStyle(
                  fontSize: MctSize.twenty.getSize.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: NOTO_BOLD),
            ),
          ),
          SizedBox(
            height: 17.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              createLearningDialogIcon(
                  text: '단소 기초 학습',
                  page: HomeDansoBasicLearningScreen(),
                  assetName: DANSO_LESSON_SVG),
              SizedBox(
                width: 14.w,
              ),
              createLearningDialogIcon(
                  page: HomeStepByStepAndTestScreen(),
                  text: '단계별 연습',
                  assetName: DANSO_STUDY_SVG),
            ],
          ),
        ],
      ),
    ),
  );
}
