import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/controllers/jangdan_and_danso_sound_controller.dart';
import 'package:project_danso/utils/danso_function.dart';
import 'package:project_danso/widgets/widgets.dart';

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
  JungganboController jungganboController = Get.put(JungganboController());
  final jangdanAndDansoSoundController =
      Get.put(JangdanAndDansoSoundController());

  @override
  void initState() {
    jungganboController.onInit();
    jungganboController.sheetHorizontal = 4;
    super.initState();
  }

  @override
  void dispose() {
    jungganboController.stepStop();
    if (jungganboController.startStopState) {
      jangdanAndDansoSoundController.jandanStop();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var testJungGanBo = JungGanBo('연습곡', widget.jangdan, widget.sheetData);
    jungganboController.jangDan = widget.jangdan;

    // jangdanAndDansoSoundController.setJandan(widget.jangdan);
    return GetBuilder<JungganboController>(
        init: jungganboController,
        builder: (controller) {
          controller.micro = testJungGanBo.jangDan.microSecond;
          controller.jungGanBo = testJungGanBo;
          controller.sheetVertical = 12;
          jangdanAndDansoSoundController.setJangdanAndDansoSoundSpeed(
              jangdanAndDansoSoundController
                  .speed[jangdanAndDansoSoundController.speedCount]);

          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 12.w),
                  child: Stack(
                    children: [
                      jungganboScreen(12, jungganboController),
                      jungganbo(
                          12, controller, testJungGanBo, controller.krState),
                      jungganboFromFlash(12, controller, testJungGanBo),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //시작하기
                        levelButton(
                            controller: controller,
                            text: '${controller.startButton}',
                            onPressed: () async {
                              controller.changeStartStopState();

                              if (controller.startStopState) {
                                await jangdanAndDansoSoundController
                                    .setJangdanAndDansoSound(
                                        widget.currentLevel);
                                controller.isPracticeState();
//                                 controller.jandanPlay();
                                jangdanAndDansoSoundController
                                    .playJangdanAndDansoSound();

                                await Get.dialog(
                                  WillPopScope(
                                    onWillPop: () async => false,
                                    child: Dialog(
                                        backgroundColor:
                                            Colors.white.withOpacity(0),
                                        elevation: 0,
                                        child: GameTimerWidget(
                                          timer: testJungGanBo.jangDan.delay ~/
                                              jangdanAndDansoSoundController
                                                      .speed[
                                                  jangdanAndDansoSoundController
                                                      .speedCount],
                                        )),
                                  ),
                                  barrierDismissible: false,
                                );
                                controller.stepStart();
                              }
                              if (!controller.startStopState) {
                                controller.isPracticeState();
                                controller.stepStop();
                                jangdanAndDansoSoundController
                                    .stopJangdanAndDansoSound();
                              }
                            }),

                        //한글한자
                        levelButton(
                            controller: controller,
                            text: '${controller.krButton}',
                            onPressed: controller.startStopState
                                ? null
                                : () {
                                    controller.changekrState();
                                  }),

                        //배속
                        levelButton(
                            controller: controller,
                            text:
                                '${jangdanAndDansoSoundController.speed[jangdanAndDansoSoundController.speedCount]} 배속',
                            onPressed: controller.startStopState
                                ? null
                                : () {
                                    controller.changespeedState();
                                  }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget levelButton(
      {required JungganboController controller,
      required Function()? onPressed,
      required String text}) {
    return Container(
        width: 105.w,
        height: 37.h,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: MctColor.buttonColorOrange.getMctColor,
                onSurface: MctColor.unButtonColorOrange.getMctColor),
            onPressed: onPressed,
            child: Text(text,
                style: TextStyle(
                    fontSize: MctSize.fourteen.getSize.sp,
                    fontFamily: NOTO_REGULAR))));
  }
}
