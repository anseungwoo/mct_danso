import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/widgets.dart';

class HomeStepByStepAndTestScreen extends StatefulWidget {
  HomeStepByStepAndTestScreen({Key? key}) : super(key: key);

  @override
  _HomeStepByStepAndTestScreenState createState() =>
      _HomeStepByStepAndTestScreenState();
}

class _HomeStepByStepAndTestScreenState
    extends State<HomeStepByStepAndTestScreen> {
  final dansoSoundLearningController = Get.put(DansoSoundLearningController());

  var controller = Get.find<MainScreenController>();
  JangdanAndDansoSoundController jangdanAndDansoSoundController =
      Get.put(JangdanAndDansoSoundController());
  @override
  void dispose() {
    super.dispose();
    dansoSoundLearningController.disposeFunction();

    if (controller.musicState.value) {
      controller.player.play();
    }
    ;
  }

  @override
  void initState() {
    super.initState();
    dansoSoundLearningController.disposeFunction();
    if (controller.musicState.value) {
      controller.player.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          tabbarAndAppBar(title: '단계별 연습', tabbar: null, enableTabBar: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leftLightCicleAvatarAndText(),
            GetBuilder<DansoSoundLearningController>(
              init: dansoSoundLearningController,
              builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 4,
                      child: dansoImage(controller),
                    ),
                    // SizedBox(width: 20.w),
                    Expanded(
                      flex: 6,
                      child: listeningAndTest(controller),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget listeningAndTest(DansoSoundLearningController controller) {
    return Container(
      height: ScreenUtil().screenHeight * 0.68,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Text('${controller.pitchValue}'),
          if (controller.listenTuningState)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '소리를 들어보세요',
                      style: TextStyle(
                          fontSize: MctSize.seventeen.getSize.sp,
                          fontFamily: NOTO_REGULAR),
                    ),
                    Text(
                      '단소에 따라 실음과 다를 수 있습니다.',
                      style:
                          TextStyle(fontSize: 13.sp, fontFamily: NOTO_REGULAR),
                    ),
                  ],
                ),
              ),
            ),
          if (controller.playTuningState)
            Expanded(
              child: Column(
                children: [
                  Center(child: Text('${controller.pitchValue} Hz')),
                  Center(
                      child: controller
                          .getPitchCorrectTextWidget(controller.pitchValue)!),
                ],
              ),
            ),
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
                style: TextStyle(
                    fontSize: 45.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: NOTO_BOLD),
              ),
            ),
          ),
          SizedBox(height: 21.h),
          Text(
            controller.hanJaAndGel[controller.soundListUpDown].toHangeul(),
            style: TextStyle(
                fontSize: MctSize.eighteen.getSize.sp, fontFamily: NOTO_MEDIUM),
          ),
          SizedBox(height: 18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UpDownButton(
                assetName: UP_SVG,
                onPressed: controller.listenTuningState
                    ? null
                    : controller.soundTuningState
                        ? null
                        : controller.playTuningState
                            ? null
                            : () async {
                                // await controller.setYulmyeng();
                                controller.soundListUp();
                              },
              ),
              SizedBox(width: 12.w),
              UpDownButton(
                assetName: DOWN_SVG,
                onPressed: controller.listenTuningState
                    ? null
                    : controller.soundTuningState
                        ? null
                        : controller.playTuningState
                            ? null
                            : () async {
                                // await controller.setYulmyeng();
                                controller.soundListDown();
                              },
              ),
            ],
          ),

          //예시듣기
          SoundButton(
            title: '${controller.buttonListen}',
            onPressed: controller.soundTuningState
                ? null
                : controller.playTuningState
                    ? null
                    : () async {
                        controller.changeSpeakTuningState();
                        if (controller.listenTuningState) {
                          await jangdanAndDansoSoundController.setListenSound(
                              controller.hanJaAndGel[controller.soundListUpDown]
                                  .getYulmyengPathFile());
                          print(controller
                              .hanJaAndGel[controller.soundListUpDown]
                              .getYulmyengPathFile());
                          // jangdanAndDansoSoundController.setListenSound(
                          //     controller.hanJaAndGel[0].getYulmyengPathFile());
                          jangdanAndDansoSoundController
                              .playJangdanAndDansoSound();
                        }
                        if (!controller.listenTuningState) {
                          jangdanAndDansoSoundController
                              .stopJangdanAndDansoSound();
                        }
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
                        controller.isRecordstate();
                        controller.isRecording
                            ? controller.startCapture()
                            : controller.stopCapture();
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
                            Get.toNamed('/steplearning');
                          },
          ),
          SizedBox(height: 5.w),
        ],
      ),
    );
  }

  Widget dansoImage(DansoSoundLearningController controller) {
    return SvgPicture.asset(
      DANSO_SVG_LIST[controller.soundListUpDown],
      height: ScreenUtil().screenHeight * 0.68,
      fit: BoxFit.fitHeight,
    );
  }

  Widget leftLightCicleAvatarAndText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
              radius: 14.r,
              backgroundColor: MctColor.rightHandColor.getMctColor),
          SizedBox(
            width: 7.sp,
          ),
          Text(
            '왼손',
            style: TextStyle(fontSize: 14.sp, fontFamily: NOTO_REGULAR),
          ),
          SizedBox(
            width: 7.sp,
          ),
          CircleAvatar(
              radius: 14.r,
              backgroundColor: MctColor.leftHandColor.getMctColor),
          SizedBox(width: 7.sp),
          Text('오른손',
              style: TextStyle(fontSize: 14.sp, fontFamily: NOTO_REGULAR)),
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
        style: ElevatedButton.styleFrom(
          elevation: 0,
          onSurface: MctColor.unButtonColorOrange.getMctColor,
          primary: MctColor.buttonColorOrange.getMctColor,
          minimumSize: Size(130.w, 45.h),
        ),
        child: Text(
          title,
          style: TextStyle(
              fontFamily: NOTO_REGULAR, fontSize: MctSize.fifteen.getSize.sp),
        ),
      ),
    );
  }
}

class UpDownButton extends StatelessWidget {
  final Function()? onPressed;
  final String assetName;
  const UpDownButton({
    Key? key,
    this.onPressed,
    required this.assetName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        onSurface: MctColor.unButtonColorOrange.getMctColor,
        primary: MctColor.buttonColorOrange.getMctColor,
        minimumSize: Size(59.w, 35.h),
      ),
      child: SvgPicture.asset(
        assetName,
        width: 20.w,
        height: 12.h,
      ),
    );
  }
}
