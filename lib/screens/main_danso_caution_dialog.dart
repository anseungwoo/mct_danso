import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/screens/screens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/widgets/main/loading_indicator.dart';
import 'package:project_danso/widgets/main/timer_widget.dart';
import 'package:project_danso/widgets/widgets.dart';

Widget mainDansoCautionDialog() {
  return Dialog(
    insetPadding: EdgeInsets.zero,
    child: Container(
      height: 260.h,
      width: 330.w,
      child: Padding(
        padding: const EdgeInsets.all(basicPadding),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(basicPadding),
              child: SvgPicture.asset(
                WARNING_SVG,
                color: unButtonColorOrang,
              ),
            ),
            Text(
              "연주 시 주의사항",
              style: TextStyle(fontSize: textSevenSize, fontWeight: bold),
            ),
            SizedBox(height: 15.h),
            Text("단소의 바람이 마이크로 들어가지 않게 해 주세요"),
            SizedBox(height: 5.h),
            Text("소음이 적은 장소에서 연주해 주세요"),
            SizedBox(height: 30.h),
            Padding(
              padding: const EdgeInsets.only(left: 37, right: 37),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "취소",
                        style: TextStyle(color: textBlack),
                      )),
                  Spacer(flex: 1),
                  TextButton(
                      onPressed: () async {
                        Get.back();
                        await Get.dialog(
                          Dialog(child: TimerWidget()),
                          barrierDismissible: false,
                        );
                        // await Future.delayed(const Duration(milliseconds: 3500));
                        // Get.back();
                        // controller.isAdjust
                        //     ? controller.stopAdjust()
                        //     : controller.startAdjust();
                        await Get.dialog(
                          Dialog(
                            child: LoadingIndicator(),
                          ),
                          barrierDismissible: false,
                        );
                        // if (controller.userInputForAdjust < 400 ||
                        //     controller.userInputForAdjust > 700) {
                        //   await Get.dialog(
                        //       testDialog(FAIL_SVG, "다시 시도 해주세요"));
                        // } else {
                        //   await Get.dialog(testDialog(SUCCESS_SVG, "성공입니다."));
                        // }
                      },
                      child: Text(
                        "확인",
                        style: TextStyle(color: textBlack),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
