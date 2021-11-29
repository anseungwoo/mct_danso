import 'package:danso_function/danso_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/controllers/main_screen_controller.dart';
import 'package:project_danso/widgets/jungganbo/jungganbo_flash.dart';
import 'package:project_danso/widgets/widgets.dart';

import 'jungganbo/jungganbo_screen.dart';

class DansoStepByStep extends StatefulWidget {
  final String sheetData;
  final String currentLevel;
  final String jangdan;
  DansoStepByStep(
      {Key? key,
      required this.sheetData,
      required this.currentLevel,
      required this.jangdan});

  @override
  _DansoStepByStepState createState() => _DansoStepByStepState();
}

class _DansoStepByStepState extends State<DansoStepByStep> {
  JungGanBoPlayer jungGanBoPlayer = new JungGanBoPlayer();
  JungganboController jungganboController = Get.put(JungganboController());

  @override
  void initState() {
    jungganboController.onInit();
    jungganboController.sheetHorizontal = 4;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var testJungGanBo = JungGanBo('연습곡', widget.jangdan, widget.sheetData);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GetBuilder<JungganboController>(
            init: jungganboController,
            builder: (controller) {
              controller.mill = testJungGanBo.jangDan.milliSecond;
              controller.jungGanBo = testJungGanBo;
              controller.sheetVertical = 12;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      jungganbo(
                          12, controller, testJungGanBo, controller.krState),
                      jungganboFromFlash(12, controller, testJungGanBo),
                      jungganboScreen(12, jungganboController),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      width: 330.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //시작하기
                          levelButton(
                              controller: controller,
                              text: '${controller.startButton}',
                              onPressed: () {
                                controller.changeStartStopState();
                                controller.startStopState
                                    ? controller.stepStart()
                                    : controller.stepStop();
                                controller.startStopState
                                    ? jungGanBoPlayer.play(testJungGanBo)
                                    : null;
                              }),

                          //한글한자
                          levelButton(
                              controller: controller,
                              text: '${controller.krButton}',
                              onPressed: () {
                                controller.startStopState
                                    ? null
                                    : controller.changekrState();
                              }),

                          //배속
                          levelButton(
                              controller: controller,
                              text:
                                  '${controller.speed[controller.speedCount]} 배속',
                              onPressed: () {
                                controller.startStopState
                                    ? null
                                    : controller.changespeedState();
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }));
  }

  Widget levelButton(
      {required JungganboController controller,
      required Function() onPressed,
      required String text}) {
    return Container(
        width: 105.w,
        height: 37.h,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: buttonColorOrang,
                onSurface: unButtonColorOrang),
            onPressed: onPressed,
            child: Text(text, style: TextStyle(fontFamily: NOTO_REGULAR))));
  }
}
