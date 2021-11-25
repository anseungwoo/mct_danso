import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';

Widget icon(
    {required String text, required Widget page, required String assetName}) {
  return InkWell(
    onTap: () {
      // Get.to(page);
      Navigator.of(Get.context!).push(MaterialPageRoute(builder: (_) => page));
    },
    child: Container(
      width: 140.w,
      height: 140.h,
      decoration: BoxDecoration(
        color: logoColor,
        borderRadius: BorderRadius.circular(10), //모서리를 둥글게as
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(assetName),
          Text(
            text,
            style: TextStyle(
                color: white,
                fontSize: textSevenSize.sp,
                fontFamily: NOTO_MEDIUM),
          ),
        ],
      ),
    ),
  );
}
