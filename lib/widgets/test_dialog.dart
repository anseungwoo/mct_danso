import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/screens/screens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/widgets/widgets.dart';

Widget testDialog(String assetName, String text) {
  return Dialog(
    insetPadding: EdgeInsets.zero,
    child: Container(
      height: 210.h,
      width: 330.w,
      child: Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 15),
        child: Column(
          children: [
            SvgPicture.asset(
              assetName,
              color: Colors.yellow,
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(text),
            ),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("확인"))
          ],
        ),
      ),
    ),
  );
}
