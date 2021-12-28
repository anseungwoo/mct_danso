import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/controllers/jangdan_and_danso_sound_controller.dart';

import 'package:project_danso/utils/danso_function.dart';
import 'package:project_danso/utils/disable_multi_touch.dart';
import 'package:project_danso/widgets/base_widgets/challenge_dialog.dart';
import 'package:project_danso/widgets/widgets.dart';

class JungGanBoPage extends StatefulWidget {
  JungGanBoPage(
      {Key? key,
      required this.appbarTitle,
      required this.jangdan,
      required this.sheetData,
      required this.sheetVertical,
      required this.sheetHorizontal,
      required this.songId})
      : super(key: key);

  final appbarTitle;
  final jangdan;
  final sheetData;
  final sheetVertical;
  final sheetHorizontal;
  final songId;

  // final songData = Get.arguments;
  // final item = Get.arguments;

  @override
  _JungGanBoPageState createState() => _JungGanBoPageState();
}

class _JungGanBoPageState extends State<JungGanBoPage> {
  final item = Get.arguments;
  late int percent;
  JungGanBoPlayer jungGanBoPlayer = JungGanBoPlayer();
  JungganboController jungganboController = Get.put(JungganboController());

  PlayAndTestController playAndTestController =
      Get.put(PlayAndTestController());
  final jangdanAndDansoSoundController =
      Get.put(JangdanAndDansoSoundController());
  // FlutterMidi flutterMidi = FlutterMidi();
  // late AudioSession audioSessions;

  @override
  void dispose() {
    if (jungganboController.startStopState) {
      if (jungganboController.isChallenge) {
        jungganboController.stopCapture();
      }
      jangdanAndDansoSoundController.jandanStop();
    }
    jungganboController.dispose();
    jungganboController.stepStop();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    jungganboController.sheetHorizontal = item['sheetHorizontal'];
    jungganboController.jangDan = item['jangdan'];
    var testJungGanBo =
        JungGanBo(item['appbarTitle'], item['jangdan'], item['sheetData']);
    jungganboController.jungGanBo = testJungGanBo;
    jungganboController.create2DList();

    return Scaffold(
      appBar: songtabbarAndAppBar(
          title: '${item['appbarTitle']}', tabbar: null, enableTabBar: false),
      body: GetBuilder<PlayAndTestController>(
          init: playAndTestController,
          builder: (controller) {
            return GetBuilder<JungganboController>(
                init: jungganboController,
                builder: (jungcontroller) {
                  jungcontroller.micro = testJungGanBo.jangDan.microSecond;
                  jungcontroller.sheetVertical = item['sheetVertical'];
                  jangdanAndDansoSoundController.setSpeed(
                      jangdanAndDansoSoundController
                          .speed[jangdanAndDansoSoundController.speedCount]);
                  return OnlyOnePointerRecognizerWidget(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 340.w,
                          child: Stack(
                            children: [
                              if (controller.statecount == 0)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //도전하기
                                    songSwapButton(
                                      text: Text('도전하기',
                                          style: TextStyle(
                                              fontSize:
                                                  MctSize.twelve.getSize.sp)),
                                      onPressed: () async {
                                        await Get.dialog(Dialog(
                                            insetAnimationDuration:
                                                Duration(seconds: 3),
                                            child: challengeDialog()));
                                        await jangdanAndDansoSoundController
                                            .setJandan(item['jangdan']);
                                        controller.nextButton();
                                        jungcontroller.isChallengeState();
                                        jangdanAndDansoSoundController
                                            .jandanPlay();
                                        await Get.dialog(
                                          WillPopScope(
                                            onWillPop: () async => false,
                                            child: Dialog(
                                                backgroundColor:
                                                    Colors.white.withOpacity(0),
                                                elevation: 0,
                                                child: GameTimerWidget(
                                                  timer: testJungGanBo
                                                          .jangDan.delay ~/
                                                      jangdanAndDansoSoundController
                                                              .speed[
                                                          jangdanAndDansoSoundController
                                                              .speedCount],
                                                )),
                                          ),
                                          barrierDismissible: false,
                                        );
                                        await jungcontroller.startCapture();
                                        jungcontroller.stepStart(
                                            songId: item['songId'],
                                            songTitle: item['appbarTitle']);

                                        jungcontroller.audioSessionConfigure();

                                        print(controller.statecount);
                                      },
                                    ),
                                    SizedBox(width: 5.w),
                                    controller.platState
                                        ? Container()
                                        //연습하기
                                        : songSwapButton(
                                            text: Text('연습하기',
                                                style: TextStyle(
                                                    fontSize: MctSize
                                                        .twelve.getSize.sp)),
                                            onPressed: () {
                                              controller.stateCountUp(2);

                                              print(controller.statecount);
                                            }),
                                    SizedBox(width: 5.w),
                                    //배속
                                    songSwapButton(
                                        text: Text(
                                            '${jangdanAndDansoSoundController.speed[jangdanAndDansoSoundController.speedCount]} 배속',
                                            style: TextStyle(
                                                fontSize:
                                                    MctSize.twelve.getSize.sp)),
                                        onPressed: () {
                                          jungganboController
                                              .changespeedState();
                                        }),
                                    SizedBox(width: 5.w),
                                    //한글 전환
                                    songSwapButton(
                                        text: Text(controller.krButton,
                                            style: TextStyle(
                                                fontSize:
                                                    MctSize.twelve.getSize.sp)),
                                        onPressed: () {
                                          controller.changeKrState();
                                        }),
                                  ],
                                ),
                              if (controller.statecount == 1) //도전하기클릭시
                                // 중지하기
                                songSwapButton(
                                  text: Text(
                                    '중지하기',
                                    style: TextStyle(
                                        fontSize: MctSize.twelve.getSize.sp),
                                  ),
                                  onPressed: () {
                                    jungcontroller.changeStartStopState();
                                    jungcontroller.stepStop();
                                    jungcontroller.stopCapture();
                                    controller.previousButton();
                                    jungcontroller.isChallengeState();
                                    jangdanAndDansoSoundController.jandanStop();
                                    print(controller.statecount);
                                  },
                                ),
                              if (controller.statecount == 2) // 연습하기 클릭시
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //연습 시작
                                    songSwapButton(
                                      text: Text('연습하기',
                                          style: TextStyle(
                                              fontSize:
                                                  MctSize.twelve.getSize.sp)),
                                      onPressed: () {
                                        controller.nextButton();
                                        print(controller.statecount);
                                      },
                                    ),
                                    SizedBox(width: 5),
                                    //녹음
                                    songSwapButton(
                                        text: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SvgPicture.asset(
                                              RECORD_SVG,
                                              width: 20.w,
                                              height: 20.h,
                                            ),
                                            Text('녹음',
                                                style: TextStyle(
                                                    fontSize: MctSize
                                                        .twelve.getSize.sp)),
                                          ],
                                        ),
                                        onPressed: () {
                                          controller.stateCountUp(6);
                                          print(controller.statecount);
                                        }),
                                    SizedBox(width: 5),
                                    //녹화
                                    songSwapButton(
                                        text: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SvgPicture.asset(
                                              TRANSCRIPTION_SVG,
                                              width: 13.w,
                                              height: 13.h,
                                            ),
                                            Text('녹화',
                                                style: TextStyle(
                                                    fontSize: MctSize
                                                        .twelve.getSize.sp)),
                                          ],
                                        ),
                                        onPressed: () {
                                          controller.stateCountUp(5);

                                          print(controller.statecount);
                                        }),
                                  ],
                                ),
                              if (controller.statecount == 3)
                                Row(
                                  children: [
                                    songSwapButton(
                                      text: Text('연습시작',
                                          style: TextStyle(
                                              fontSize:
                                                  MctSize.twelve.getSize.sp)),
                                      onPressed: () async {
                                        await jangdanAndDansoSoundController
                                            .setJangdanAndDansoSound(
                                                item['appbarTitle']);
                                        jungcontroller.changeStartStopState();
                                        controller.nextButton();
                                        jangdanAndDansoSoundController
                                            .jandanPlay();
                                        await Get.dialog(
                                          WillPopScope(
                                            onWillPop: () async => false,
                                            child: Dialog(
                                                backgroundColor:
                                                    Colors.white.withOpacity(0),
                                                elevation: 0,
                                                child: GameTimerWidget(
                                                  timer: testJungGanBo
                                                          .jangDan.delay ~/
                                                      jangdanAndDansoSoundController
                                                              .speed[
                                                          jangdanAndDansoSoundController
                                                              .speedCount],
                                                )),
                                          ),
                                          barrierDismissible: false,
                                        );

                                        jungcontroller.isLevelPracticeState();
                                        jungcontroller.stepStart();
                                      },
                                    ),
                                    SizedBox(width: 5),
                                    songSwapButton(
                                      text: Text('반주만',
                                          style: TextStyle(
                                              fontSize:
                                                  MctSize.twelve.getSize.sp)),
                                      onPressed: () async {
                                        await jangdanAndDansoSoundController
                                            .setJandan(item['jangdan']);
                                        jungcontroller.isLevelPracticeState();
                                        jungcontroller.changeStartStopState();
                                        controller.nextButton();
                                        jangdanAndDansoSoundController
                                            .jandanPlay();
                                        await Get.dialog(
                                          WillPopScope(
                                            onWillPop: () async => false,
                                            child: Dialog(
                                                backgroundColor:
                                                    Colors.white.withOpacity(0),
                                                elevation: 0,
                                                child: GameTimerWidget(
                                                  timer: testJungGanBo
                                                          .jangDan.delay ~/
                                                      jangdanAndDansoSoundController
                                                              .speed[
                                                          jangdanAndDansoSoundController
                                                              .speedCount],
                                                )),
                                          ),
                                          barrierDismissible: false,
                                        );
                                        jungcontroller.stepStart();
                                      },
                                    ),
                                  ],
                                ),
                              if (controller.statecount == 4)
                                Row(
                                  children: [
                                    songSwapButton(
                                      text: Text('중지',
                                          style: TextStyle(
                                              fontSize:
                                                  MctSize.twelve.getSize.sp)),
                                      onPressed: () {
                                        jungcontroller.changeStartStopState();
                                        jungcontroller.stepStop();
                                        jangdanAndDansoSoundController
                                            .jandanStop();
                                        jungcontroller.isLevelPracticeState();
                                        controller.stateCountUp(0);
                                        print(controller.statecount);
                                        // jungcontroller.audioSessions
                                        //     .setActive(false);
                                      },
                                    ),
                                    SizedBox(width: 5),
                                    songSwapButton(
                                      text: Text('반주만',
                                          style: TextStyle(
                                              fontSize:
                                                  MctSize.twelve.getSize.sp)),
                                      onPressed: null,
                                    ),
                                  ],
                                ),
                              if (controller.statecount == 5)
                                SongCamaraRecoding(
                                  jungGanBo: testJungGanBo,
                                  jangdan: item['jangdan'],
                                  songId: item['songId'],
                                ),
                              if (controller.statecount == 6)
                                SongAudioRecorder(
                                  jungGanBo: testJungGanBo,
                                  jangdan: item['jangdan'],
                                  songId: item['songId'],
                                )
                            ],
                          ),
                        ),
                        if (controller.statecount != 5)
                          Container(
                            width: 335.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${jangdanAndDansoSoundController.speed[jangdanAndDansoSoundController.speedCount]} 배속',
                                  style: TextStyle(
                                      fontSize: MctSize.twelve.getSize.sp,
                                      fontFamily: NOTO_REGULAR),
                                ),
                                Text(
                                  '${item['jangdan']}',
                                  style: TextStyle(
                                      fontSize: MctSize.twelve.getSize.sp,
                                      fontFamily: NOTO_REGULAR),
                                )
                              ],
                            ),
                          ),
                        Container(
                          margin:
                              EdgeInsets.only(right: MctSize.twelve.getSize.w),
                          // color: Colors.white,
                          // width: ScreenUtil().screenWidth,
                          // alignment: Alignment.center,
                          child: Stack(
                            children: [
                              jungganboScreen(
                                  item['sheetVertical'], jungcontroller),
                              jungganbo(item['sheetVertical'], jungcontroller,
                                  testJungGanBo, controller.krChanges),
                              jungganboFromFlash(item['sheetVertical'],
                                  jungcontroller, testJungGanBo),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }),
    );
  }

  Widget songSwapButton({Widget? text, Function()? onPressed}) {
    return Container(
      width: 81.w,
      height: 30.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: MctColor.white.getMctColor,
            onPrimary: MctColor.buttonColorOrange.getMctColor,
            side: BorderSide(color: MctColor.buttonColorOrange.getMctColor),
            textStyle: TextStyle(
                fontSize: MctSize.twelve.getSize.sp,
                color: MctColor.buttonColorOrange.getMctColor,
                fontFamily: NOTO_REGULAR)),
        onPressed: onPressed,
        child: text,
      ),
    );
  }
}
