import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/color.dart';
import 'package:project_danso/common/contant.dart';
import 'package:project_danso/common/icon.dart';
import 'package:project_danso/common/size.dart';

Widget icon(
    {required String text, required Widget page, required String assetName}) {
  return InkWell(
    onTap: () {
      // Get.to(page);
      Navigator.of(Get.context!).push(MaterialPageRoute(builder: (_) => page));
    },
    child: Container(
      width: 140.w,
      height: 140.w,
      decoration: BoxDecoration(
        color: MctColor.lightYellow.getMctColor,
        borderRadius: BorderRadius.circular(10), //모서리를 둥글게as
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
