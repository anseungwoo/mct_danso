import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/screens/screens.dart';
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

  var controller = Get.find<MainScreenController>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    if (controller.musicState) {
      controller.assetsAudioPlayer.play();
    }
    ;
  }

  @override
  void initState() {
    super.initState();

    if (controller.musicState) {
      // 아예 정지
      // Get.find<MainScreenController>().disposeAudioPlayer();
      // 일시 정지
      controller.assetsAudioPlayer.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          tabbarAndAppBar(title: '단계별 연습', tabbar: null, enableTabBar: false),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          leftLightCicleAvatarAndText(),
          GetBuilder<DansoSoundLearningController>(
              init: dansoSoundLearningController,
              builder: (controller) {
                return Container(
                  // padding: EdgeInsets.symmetric(horizontal: 30),
                  // width: 330.w,
                  // height: 500.h,
                  child: Row(
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
                  ),
                );
              }),
        ],
      ),
    );
  }

  Widget listeningAndTest(DansoSoundLearningController controller) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Text('${controller.pitchValue}'),
          if (controller.listenTuningState)
            Column(
              children: [
                Text(
                  '소리를 들어보세요',
                  style: TextStyle(
                      fontSize: textSevenSize.sp, fontFamily: NOTO_REGULAR),
                ),
                Text(
                  '단소에 따라 실음과 다를 수 있습니다.',
                  style: TextStyle(fontSize: 13.sp, fontFamily: NOTO_REGULAR),
                ),
              ],
            ),
          if (controller.playTuningState)
            controller.soundMatch(controller.pitchValue)!,

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
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  fontFamily: NOTO_BOLD),
            )),
          ),
          SizedBox(height: 21.h),
          Text(controller.hanJaAndGel[controller.soundListUpDown].toHangeul(),
              style: TextStyle(
                  fontSize: textEightSize.sp, fontFamily: NOTO_MEDIUM)),
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

          //예시듣기
          SoundButton(
            title: '${controller.buttonListen}',
            onPressed: controller.soundTuningState
                ? null
                : controller.playTuningState
                    ? null
                    : () {
                        controller.changeSpeakTuningState();
                        controller.listenTuningState
                            ? controller.palySound()
                            : null;
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
                            Get.to(MainDansoLearningLevelScreen());
                          },
          ),
        ],
      ),
    );
  }

  Widget dansoImage(DansoSoundLearningController controller) {
    return SvgPicture.asset(
      DANSO_SVG_LIST[controller.soundListUpDown],
      // height: 500.h,
      fit: BoxFit.fitHeight,
    );
  }

  Widget leftLightCicleAvatarAndText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(radius: 14.r, backgroundColor: rightColor),
          SizedBox(
            width: 7.sp,
          ),
          InkWell(
              onTap: () {
                Get.to(ResultScore());
              },
              child: Text(
                '왼손',
                style: TextStyle(fontSize: 14.sp, fontFamily: NOTO_REGULAR),
              )),
          SizedBox(
            width: 7.sp,
          ),
          CircleAvatar(radius: 14.r, backgroundColor: leftColor),
          SizedBox(width: 7.sp),
          InkWell(
              onTap: () {
                // Get.to(Music());
              },
              child: Text('오른손',
                  style: TextStyle(fontSize: 14.sp, fontFamily: NOTO_REGULAR))),
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
        child: Text(
          title,
          style: TextStyle(fontFamily: NOTO_REGULAR),
        ),
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
