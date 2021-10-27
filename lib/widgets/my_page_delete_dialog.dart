import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';

Widget myPageDeleteDialog() {
  return Dialog(
    child: GetBuilder<MyPageController>(
        init: MyPageController(),
        builder: (controller) {
          return Container(
            height: 170.h,
            width: 330.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(43.0),
                  child: Text(
                    "삭제하겠습니까?",
                    style: TextStyle(fontSize: textStyleSize),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Text(
                          "취소",
                          style: TextStyle(color: textBlack),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      Spacer(flex: 1),
                      TextButton(
                        child: Text(
                          "확인",
                          style: TextStyle(color: textBlack),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
  );
}
