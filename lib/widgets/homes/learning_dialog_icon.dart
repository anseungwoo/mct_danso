import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';

Widget createLearningDialogIcon(
    {required String text, required Widget page, required String assetName}) {
  return InkWell(
    onTap: () {
      Navigator.of(Get.context!).push(MaterialPageRoute(builder: (_) => page));
    },
    child: Container(
      width: 140.w,
      height: 140.w,
      decoration: BoxDecoration(
        color: MctColor.lightYellow.getMctColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assetName,
            width: 70.w,
            height: 50.h,
          ),
          Text(
            text,
            style: TextStyle(
                color: MctColor.white.getMctColor,
                fontSize: MctSize.seventeen.getSize.sp,
                fontFamily: NOTO_MEDIUM),
          ),
        ],
      ),
    ),
  );
}
