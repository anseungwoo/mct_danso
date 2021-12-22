import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';

Widget myPageDeleteDialog(var path, exerId) {
  final audioAndVideoListController = Get.put(AudioAndVideoListController());
  return Dialog(
    insetPadding: EdgeInsets.zero,
    child: GetBuilder<AudioAndVideoListController>(
        init: audioAndVideoListController,
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
                    style: TextStyle(fontSize: MctSize.eighteen.getSize.sp),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    yesNoButton(
                      text: '취소',
                      onPress: () {
                        Get.back();
                      },
                    ),
                    yesNoButton(
                      text: '확인',
                      onPress: () {
                        controller.DeleteFile(path, exerId);
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        }),
  );
}

Padding yesNoButton({required String text, required Function() onPress}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
    child: TextButton(
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(
              color: MctColor.black.getMctColor,
              fontSize: MctSize.fifteen.getSize.sp),
        )),
  );
}
