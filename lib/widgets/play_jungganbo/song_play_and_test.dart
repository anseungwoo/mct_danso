import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/controllers/jangdan_and_danso_sound_controller.dart';
import 'package:project_danso/controllers/pitch_check_controller.dart';
import 'package:project_danso/utils/danso_function.dart';
import 'package:project_danso/widgets/widgets.dart';

class SongPlayAndTest extends StatefulWidget {
  final String appbarTitle;
  final String sheetData;
  final String jangdan;
  final int sheetVertical;
  final int sheetHorizontal;
  final int songId;

  SongPlayAndTest(
      {Key? key,
      required this.appbarTitle,
      required this.jangdan,
      required this.sheetData,
      required this.sheetVertical,
      required this.sheetHorizontal,
      required this.songId})
      : super(key: key);

  // final songData = Get.arguments;

  @override
  _SongPlayAndTestState createState() => _SongPlayAndTestState();
}

class _SongPlayAndTestState extends State<SongPlayAndTest> {
  late int percent;
  JungGanBoPlayer jungGanBoPlayer = JungGanBoPlayer();
  JungganboController jungganboController = Get.put(JungganboController());
  PitchCheckController pitchCheckController = Get.put(PitchCheckController());
  PlayAndTestController playAndTestController =
      Get.put(PlayAndTestController());
  final jangdanAndDansoSoundController =
      Get.put(JangdanAndDansoSoundController());
  FlutterMidi flutterMidi = FlutterMidi();
  // late AudioSession audioSessions;

  @override
  void dispose() {
    if (jungganboController.startStopState) {
      if (jungganboController.isChallenge) {
        pitchCheckController.stopCapture();
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
    jungganboController.sheetHorizontal = widget.sheetHorizontal;
    jungganboController.jangDan = widget.jangdan;
    var testJungGanBo =
        JungGanBo(widget.appbarTitle, widget.jangdan, widget.sheetData);
    jungganboController.jungGanBo = testJungGanBo;

    pitchCheckController.create2DList();

    return Scaffold(
      appBar: songtabbarAndAppBar(
          title: '${widget.appbarTitle}', tabbar: null, enableTabBar: false),
      body: GetBuilder<PlayAndTestController>(
          init: playAndTestController,
          builder: (controller) {
            return GetBuilder<JungganboController>(
                init: jungganboController,
                builder: (jungcontroller) {
                  jungcontroller.micro = testJungGanBo.jangDan.microSecond;
                  jungcontroller.sheetVertical = widget.sheetVertical;
                  jangdanAndDansoSoundController.setSpeed(
                      jangdanAndDansoSoundController
                          .speed[jangdanAndDansoSoundController.speedCount]);
                  return Column(
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
                                      controller.nextButton();
                                      jangdanAndDansoSoundController
                                          .setJandan(widget.jangdan);

                                      jungcontroller.isChallengeState();
                                      await Get.dialog(
                                        Dialog(
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
                                        barrierDismissible: false,
                                      );
                                      jangdanAndDansoSoundController
                                          .jandanPlay();
                                      jungcontroller.stepStart(
                                          songId: widget.songId,
                                          songTitle: widget.appbarTitle);
                                      await pitchCheckController.startCapture();

                                      // jungcontroller.audioSessionConfigure();

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
                                        jungganboController.changespeedState();
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
                                  pitchCheckController.stopCapture();
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
                                      jangdanAndDansoSoundController
                                          .setJangdanAndDansoSound(
                                              widget.appbarTitle);
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
                                        jangdanAndDansoSoundController
                                            .setJandan(widget.jangdan);
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
                                        jangdanAndDansoSoundController
                                            .setJandan(widget.jangdan);

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
                                      jungcontroller.changeStartStopState();
                                      controller.nextButton();
                                      jangdanAndDansoSoundController
                                          .jandanPlay();
                                      await Get.dialog(
                                        Dialog(
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
                                      jangdanAndDansoSoundController
                                          .setJandan(widget.jangdan);

                                      jungcontroller.changeStartStopState();
                                      controller.nextButton();
                                      await Get.dialog(
                                        Dialog(
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
                                        barrierDismissible: false,
                                      );
                                      //  jungcontroller.startCapture();
                                      jungcontroller.isLevelPracticeState();
                                      jangdanAndDansoSoundController
                                          .jandanPlay();
                                      jungcontroller.stepStart();
                                      // jungcontroller.audioSessionConfigure();
                                      // audioSessionConfigure();
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
                                controller: jungcontroller,
                                jangdan: widget.jangdan,
                                songId: widget.songId,
                              ),
                            if (controller.statecount == 6)
                              SongAudioRecorder(
                                controller: jungcontroller,
                                jangdan: widget.jangdan,
                                songId: widget.songId,
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
                                '${widget.jangdan}',
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
                                widget.sheetVertical, jungcontroller),
                            jungganbo(widget.sheetVertical, jungcontroller,
                                testJungGanBo, controller.krChanges),
                            jungganboFromFlash(widget.sheetVertical,
                                jungcontroller, testJungGanBo),
                          ],
                        ),
                      ),
                    ],
                  );
                });
          }),
    );
  }

  // void showLoadingIndicator(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         backgroundColor: Colors.black.withOpacity(0),
  //         content: Center(
  //           child: Stack(
  //             children: [
  //               Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   CircularProgressIndicator(
  //                     valueColor: AlwaysStoppedAnimation(white),
  //                   ),
  //                   SizedBox(
  //                     height: 5.h,
  //                   ),
  //                   Text(
  //                     '녹화화면을 준비하고 있습니다',
  //                     style: TextStyle(color: white, fontSize: textEightSize),
  //                   ),
  //                   Text(
  //                     '녹화시작 버튼을 누르고 녹화시작',
  //                     style: TextStyle(color: white, fontSize: textEightSize),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // void hideOpenDialog() {
  //   Get.back();
  // }

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
