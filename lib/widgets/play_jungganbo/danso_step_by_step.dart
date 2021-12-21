import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
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
  JungGanBoPlayer jungGanBoPlayer = JungGanBoPlayer();
  JungganboController jungganboController = Get.put(JungganboController());
  IndexManager indexManager = IndexManager();

  @override
  void initState() {
    jungganboController.onInit();
    jungganboController.sheetHorizontal = 4;

    super.initState();
  }

  @override
  void dispose() {
    indexManager.stopIndex();
    jungganboController.stepStop();
    jungganboController.allMidiStop();
    if (jungganboController.startStopState) {
      jungganboController.jandanStop();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var testJungGanBo = JungGanBo('연습곡', widget.jangdan, widget.sheetData);
    jungganboController.jangDan = widget.jangdan;
    jungganboController.setJandan(widget.jangdan);

    return GetBuilder<JungganboController>(
        init: jungganboController,
        builder: (controller) {
          controller.mill = testJungGanBo.jangDan.milliSecond;
          controller.jungGanBo = testJungGanBo;
          controller.sheetVertical = 12;
          // controller.setSpeed(
          //     widget.jangdan, controller.speed[controller.speedCount]);
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
                                await Get.dialog(
                                  Dialog(
                                      backgroundColor:
                                          Colors.white.withOpacity(0),
                                      elevation: 0,
                                      child: GameTimerWidget()),
                                  barrierDismissible: false,
                                );
                                // controller.startCapture();
                                controller.isPracticeState();
                                controller.stepStart();
                                controller.playJungGanBo(indexManager);
                                controller.jandanPlay();
                                // controller.audioSessionConfigure();
                              }
                              if (!controller.startStopState) {
                                // controller.stopCapture();
                                controller.isPracticeState();
                                controller.stepStop();
                                indexManager.stopIndex();
                                controller.jandanStop();
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
                                '${controller.speed[controller.speedCount]} 배속',
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
