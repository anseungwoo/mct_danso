import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';

import 'package:project_danso/screens/screens.dart';
import 'package:project_danso/widgets/main/loading_indicator.dart';
import 'package:project_danso/widgets/music.dart';
import 'package:project_danso/widgets/test_dialog.dart';
import 'package:project_danso/widgets/main/timer_widget.dart';
import 'package:project_danso/widgets/widgets.dart';

class MainDansoLearningTestScreen extends StatefulWidget {
  MainDansoLearningTestScreen({Key? key}) : super(key: key);

  @override
  _MainDansoLearningTestScreenState createState() =>
      _MainDansoLearningTestScreenState();
}

class _MainDansoLearningTestScreenState
    extends State<MainDansoLearningTestScreen> {
  final dansoSoundLearningController = Get.put(DansoSoundLearningController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          tabbarAndAppBar(title: '단계별 연습', tabbar: null, enableTabBar: false),
      body: Padding(
        padding: const EdgeInsets.all(basicPadding),
        child: Column(
          children: [
            leftLightCicleAvatarAndText(),
            SizedBox(height: 40.h),
            GetBuilder<DansoSoundLearningController>(
                init: dansoSoundLearningController,
                builder: (controller) {
                  return Container(
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          dansoImage(controller),
                          SizedBox(width: 20.w),
                          listeningAndTest(controller)
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget listeningAndTest(DansoSoundLearningController controller) {
    return Expanded(
      child: Container(
        child: Stack(
          children: [
            if (controller.listenTuningState)
              Column(
                children: [
                  Text(
                    '소리를 들어보세요',
                    style: TextStyle(fontSize: textSevenSize.sp),
                  ),
                  Text(
                    "단소에 따라 실음과 다를 수 있습니다.",
                    style: TextStyle(fontSize: 13.sp),
                  )
                ],
              )
            // else if (controller.soundTuningState)
            //   // Text('${controller.userInputForAdjust}')
            // else if (controller.playTuningState)
            //   controller.soundMatch(controller.pitch)!
            else
              Text(""),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 97.w,
                  width: 97.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                  child: Center(
                      child: Text(
                    controller.hanJaAndGel[controller.soundListUpDown]
                        .toChineseCharacter(),
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  )),
                ),
                SizedBox(height: 21.h),
                Text(
                    controller.hanJaAndGel[controller.soundListUpDown]
                        .toHangeul(),
                    style: TextStyle(fontSize: textEightSize.sp)),
                SizedBox(height: 18.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UpDownButton(
                      icons: Icons.arrow_upward,
                      onPressed: () {
                        controller.listenTuningState
                            ? null
                            : controller.soundTuningState
                                ? null
                                : controller.playTuningState
                                    ? null
                                    : controller.soundListUp();
                      },
                    ),
                    SizedBox(width: 12.w),
                    UpDownButton(
                      icons: Icons.arrow_downward,
                      onPressed: () {
                        controller.listenTuningState
                            ? null
                            : controller.soundTuningState
                                ? null
                                : controller.playTuningState
                                    ? null
                                    : controller.soundListDown();
                      },
                    ),
                  ],
                ),
                //기준음
                // SoundButton(
                //   title: '${controller.tuningButtonText}',
                //   onPressed: controller.listenTuningState
                //       ? null
                //       : controller.playTuningState
                //           ? null
                //           : () async {
                //               controller.changeSoundTuningState();
                //               controller.soundListTa(4);
                //               await Get.dialog(mainDansoCautionDialog());
                //               await Get.dialog(
                //                 Dialog(child: TimerWidget()),
                //                 barrierDismissible: false,
                //               );
                //               // await Future.delayed(
                //               //     const Duration(milliseconds: 3500));
                //               // Get.back();
                //               // controller.isAdjust
                //               //     ? controller.stopAdjust()
                //               //     : controller.startAdjust();
                //               // await Get.dialog(Dialog(
                //               //   child: LoadingIndicator(),
                //               // ));
                //               // if (controller.userInputForAdjust < 400 ||
                //               //     controller.userInputForAdjust > 700) {
                //               //   await Get.dialog(
                //               //       testDialog(FAIL_SVG, "다시 시도 해주세요"));
                //               // } else {
                //               //   await Get.dialog(testDialog(SUCCESS_SVG, "성공입니다."));
                //               // }
                //             },
                // ),

                //예시듣기
                SoundButton(
                  title: '${controller.buttonListen}',
                  onPressed: controller.soundTuningState
                      ? null
                      : controller.playTuningState
                          ? null
                          : () {
                              controller.changeSpeakTuningState();
                              // controller.listenTuningState
                              //     ? controller.palySound()
                              //     : null;
                            },
                ),
                //불어보기
                SoundButton(
                  title: '${controller.buttonPlay}',
                  onPressed: controller.listenTuningState
                      ? null
                      : controller.soundTuningState
                          ? null
                          : () {
                              controller.changePlayState();
                              controller.isRecording
                                  ? controller.stopRecording()
                                  : controller.startRecording();
                            },
                ),
                //연습하기
                SoundButton(
                  title: '연습하기',
                  onPressed: controller.listenTuningState
                      ? null
                      : controller.soundTuningState
                          ? null
                          : controller.playTuningState
                              ? null
                              : () {
                                  Get.to(MainDansoLearningLevelScreen());
                                },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget dansoImage(DansoSoundLearningController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Center(
        child: Column(
          children: [
            // Text("${controller.userInputForAdjust}"),
            SvgPicture.asset(DANSO_SVG_LIST[controller.soundListUpDown]),
          ],
        ),
      ),
    );
  }

  Widget leftLightCicleAvatarAndText() {
    return Padding(
      padding: const EdgeInsets.all(eightPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(radius: 14, backgroundColor: Colors.black),
          SizedBox(
            width: 7.sp,
          ),
          InkWell(
              onTap: () {
                Get.to(ResultScore());
              },
              child: Text('왼손')),
          SizedBox(
            width: 7.sp,
          ),
          CircleAvatar(radius: 14, backgroundColor: leftColor),
          SizedBox(width: 7.sp),
          InkWell(
              onTap: () {
                // Get.to(Music());
              },
              child: Text('오른손')),
        ],
      ),
    );
  }
}

class SoundButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const SoundButton({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          onSurface: unButtonColorOrang,
          primary: buttonColorOrang,
          minimumSize: Size(130.w, 45.h),
        ),
      ),
    );
  }
}

class UpDownButton extends StatelessWidget {
  final IconData icons;
  final Function()? onPressed;
  const UpDownButton({
    Key? key,
    required this.icons,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(icons),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        onSurface: unButtonColorOrang,
        primary: buttonColorOrang,
        minimumSize: Size(59.w, 35.h),
      ),
    );
  }
}
