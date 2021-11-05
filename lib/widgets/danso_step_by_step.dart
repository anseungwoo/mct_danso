import 'package:danso_function/danso_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/controllers/flash_controller.dart';
import 'package:project_danso/widgets/jungganbo/jungganbo_flash.dart';
import 'package:project_danso/widgets/widgets.dart';

import 'jungganbo/jungganbo_screen.dart';

class DansoStepByStep extends StatelessWidget {
  final String sheetData;
  String currentLevel;
  DansoStepByStep(
      {Key key, @required this.sheetData, @required this.currentLevel});
  FlashController flashController;

  @override
  Widget build(BuildContext context) {
    JungGanBo testJungGanBo = new JungGanBo("도라지타령", "세마치장단", sheetData);
    return Padding(
        padding: const EdgeInsets.all(basicPadding),
        child: GetBuilder<JungganboController>(
            init: JungganboController(),
            builder: (controller) {
              return Column(
                children: [
                  Center(
                    child: Text(
                      '$currentLevel레벨 연습곡',
                      style: TextStyle(
                          fontSize: textSingleSize.sp, fontWeight: bold),
                    ),
                  ),
                  Stack(
                    children: [
                      jungganbo(12, Get.find<JungganboController>(),
                          testJungGanBo, true),
                      jungganboFromFlash(
                          12, Get.find<JungganboController>(), testJungGanBo),
                      jungganboScreen(12),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 30.h,
                          width: 160.w,
                          child: ElevatedButton(
                              onPressed: () {
                                controller.changeStartStopState();
                                controller.starStopState
                                    ? controller.stepStart()
                                    : controller.stepStop();
                              },
                              child: Text('${controller.startButton}'))),
                      Spacer(
                        flex: 1,
                      ),
                      Container(
                          height: 30.h,
                          width: 160.w,
                          child: ElevatedButton(
                              onPressed: () {
                                controller.starStopState
                                    ? null
                                    : controller.changespeedState();
                              },
                              child: Text(
                                  '${controller.speed[controller.speedCount]}배속'))),
                    ],
                  ),
                ],
              );
            }));
  }
}
