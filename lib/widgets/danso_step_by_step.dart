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

class DansoStepByStep extends StatefulWidget {
  final String sheetData;
  final String currentLevel;
  DansoStepByStep(
      {Key key, @required this.sheetData, @required this.currentLevel});

  @override
  _DansoStepByStepState createState() => _DansoStepByStepState();
}

class _DansoStepByStepState extends State<DansoStepByStep> {
  FlashController flashController;
  JungGanBoPlayer jungGanBoPlayer = new JungGanBoPlayer();
  JungganboController jungganboController = Get.put(JungganboController());

  @override
  void initState() {
    jungganboController.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var testJungGanBo = JungGanBo('도라지타령', '세마치장단', widget.sheetData);
    return Padding(
        padding: const EdgeInsets.all(basicPadding),
        child: GetBuilder<JungganboController>(
            init: jungganboController,
            builder: (controller) {
              return Column(
                children: [
                  Center(
                    child: Text(
                      '${widget.currentLevel}레벨 연습곡',
                      style: TextStyle(
                          fontSize: textSingleSize.sp, fontWeight: bold),
                    ),
                  ),
                  Stack(
                    children: [
                      jungganbo(12, Get.find<JungganboController>(),
                          testJungGanBo, controller.krState),
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
                          width: 105.w,
                          height: 37.h,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: buttonColorOrang,
                                  onSurface: unButtonColorOrang),
                              onPressed: () {
                                controller.changeStartStopState();
                                controller.starStopState
                                    ? controller.stepStart()
                                    : controller.stepStop();
                                controller.starStopState
                                    ? jungGanBoPlayer.play(testJungGanBo)
                                    : null;
                              },
                              child: Text('${controller.startButton}'))),
                      SizedBox(width: 7.w),
                      Container(
                          width: 105.w,
                          height: 37.h,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: buttonColorOrang,
                                  onSurface: unButtonColorOrang),
                              onPressed: () {
                                controller.starStopState
                                    ? null
                                    : controller.changekrState();
                              },
                              child: Text('${controller.krButton}'))),
                      SizedBox(width: 8.w),
                      Container(
                          width: 105.w,
                          height: 37.h,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: buttonColorOrang,
                                  onSurface: unButtonColorOrang),
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
