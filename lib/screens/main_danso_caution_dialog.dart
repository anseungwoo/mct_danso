import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/screens/screens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/widgets/widgets.dart';

Widget mainDansoCautionDialog() {
  return Dialog(
    insetPadding: EdgeInsets.zero,
    child: Container(
      height: 260.h,
      width: 330.w,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              size: 60,
              color: Colors.yellow,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "연주 시 주의사항",
                style: TextStyle(fontSize: textSevenSize, fontWeight: bold),
              ),
            ),
            Text("단소의 바람이 마이크로 들어가지 않게 해 주세요"),
            SizedBox(height: 5.h),
            Text("소음이 적은 장소에서 연주해 주세요"),
            SizedBox(height: 15.h),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "확인",
                  style: TextStyle(color: textBlack),
                )),
          ],
        ),
      ),
    ),
  );
}
