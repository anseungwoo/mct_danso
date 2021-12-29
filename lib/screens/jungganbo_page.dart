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

  @override
  _JungGanBoPageState createState() => _JungGanBoPageState();
}

class _JungGanBoPageState extends State<JungGanBoPage> {
  late int percent;
  JungGanBoPlayer jungGanBoPlayer = JungGanBoPlayer();
  JungganboController jungganboController = Get.put(JungganboController());

  PlayAndTestController playAndTestController =
      Get.put(PlayAndTestController());
  final jangdanAndDansoSoundController =
      Get.put(JangdanAndDansoSoundController());

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
  Widget build(BuildContext context) {
    jungganboController.sheetHorizontal = widget.sheetHorizontal;
    jungganboController.jangDan = widget.jangdan;
    var testJungGanBo =
        JungGanBo(widget.appbarTitle, widget.jangdan, widget.sheetData);
    jungganboController.jungGanBo = testJungGanBo;
    jungganboController.create2DList();

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
              return OnlyOnePointerRecognizerWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 340.w,
                      child: Stack(
                        children: [
                          if (controller.statecount ==
                              0) // 맨 처음 버튼 도전하기, 연습하기 ,한글/한자 ,배속
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //도전하기
                                songSwapButton(
                                  text: Text('도전하기',
                                      style: TextStyle(
                                          fontSize: MctSize.twelve.getSize.sp)),
                                  onPressed: () async {
                                    await Get.dialog(Dialog(
                                        insetAnimationDuration:
                                            Duration(seconds: 3),
                                        child:
                                            challengeDialog())); //도전하기전 경고문을 띄워줌
                                    await jangdanAndDansoSoundController
                                        .setJandan(widget.jangdan); //장단 파일을 열어줌
                                    controller.nextButton(); // 중지 버튼으로
                                    jungcontroller
                                        .isChallengeState(); //도전하기시 경험치를 관련
                                    jangdanAndDansoSoundController
                                        .jandanPlay(); //장단을 플레이
                                    await Get.dialog(
                                      //예박을 위한 준비 단계
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
                                    await jungcontroller.startCapture(); //음인식시작
                                    jungcontroller.stepStart(
                                        //애니매이션 실행
                                        songId: widget.songId,
                                        songTitle: widget.appbarTitle);

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
                                                fontSize:
                                                    MctSize.twelve.getSize.sp)),
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
                          if (controller.statecount == 1) //도전하기클릭시 중지버튼이 나옴

                            // 도전하기  중지하기 버튼
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
                          if (controller.statecount ==
                              2) // 연습하기 클릭시 연습하기, 녹음 ,녹화 버튼이 나옴
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //연습 시작
                                songSwapButton(
                                  text: Text('연습하기'),
                                  onPressed: () {
                                    controller.nextButton();
                                    print(controller.statecount);
                                  },
                                ),
                                SizedBox(width: 5.w),
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
                                      Text(
                                        '녹음',
                                        style: TextStyle(
                                            fontSize:
                                                MctSize.twelve.getSize.sp),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    controller.stateCountUp(6);
                                  },
                                ),
                                SizedBox(width: 5.w),
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
                                              fontSize:
                                                  MctSize.twelve.getSize.sp)),
                                    ],
                                  ),
                                  onPressed: () {
                                    controller.stateCountUp(5);

                                    print(controller.statecount);
                                  },
                                ),
                              ],
                            ),
                          if (controller.statecount ==
                              3) //연습하기 클릭시 연습시작, 반주만 버튼이 나옴
                            Row(
                              children: [
                                songSwapButton(
                                  //연습 시작 버튼
                                  text: Text('연습시작',
                                      style: TextStyle(
                                          fontSize: MctSize.twelve.getSize.sp)),
                                  onPressed: () async {
                                    await jangdanAndDansoSoundController
                                        .setJangdanAndDansoSound(
                                            widget.appbarTitle);
                                    jungcontroller.changeStartStopState();
                                    controller.nextButton();
                                    jangdanAndDansoSoundController.jandanPlay();
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
                                          ),
                                        ),
                                      ),
                                      barrierDismissible: false,
                                    );

                                    jungcontroller.isLevelPracticeState();
                                    jungcontroller.stepStart();
                                  },
                                ),
                                SizedBox(width: 5),
                                //반주만 버튼
                                songSwapButton(
                                  text: Text('반주만',
                                      style: TextStyle(
                                          fontSize: MctSize.twelve.getSize.sp)),
                                  onPressed: () async {
                                    await jangdanAndDansoSoundController
                                        .setJandan(widget.jangdan);
                                    jungcontroller.isLevelPracticeState();
                                    jungcontroller.changeStartStopState();
                                    controller.nextButton();
                                    jangdanAndDansoSoundController.jandanPlay();
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
                          if (controller.statecount ==
                              4) //연습시작 클릭시 -> 중지 , 반주만 버튼이 나옴
                            Row(
                              children: [
                                //중지버튼
                                songSwapButton(
                                  text: Text('중지',
                                      style: TextStyle(
                                          fontSize: MctSize.twelve.getSize.sp)),
                                  onPressed: () {
                                    jungcontroller.changeStartStopState();
                                    jungcontroller.stepStop();
                                    jangdanAndDansoSoundController.jandanStop();
                                    jungcontroller.isLevelPracticeState();
                                    controller.stateCountUp(0);
                                    print(controller.statecount);
                                    // jungcontroller.audioSessions
                                    //     .setActive(false);
                                  },
                                ),
                                SizedBox(width: 5),
                                //반주만 버튼
                                songSwapButton(
                                  text: Text('반주만',
                                      style: TextStyle(
                                          fontSize: MctSize.twelve.getSize.sp)),
                                  onPressed: null,
                                ),
                              ],
                            ),
                          if (controller.statecount == 5) // 녹화 버튼을 보여줌
                            SongCamaraRecoding(
                              jungGanBo: testJungGanBo,
                              jangdan: widget.jangdan,
                              songId: widget.songId,
                            ),
                          if (controller.statecount == 6) //녹음 버튼을 보여줌
                            SongAudioRecorder(
                              jungGanBo: testJungGanBo,
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
                      margin: EdgeInsets.only(right: MctSize.twelve.getSize.w),
                      child: Stack(
                        children: [
                          jungganboScreen(widget.sheetVertical, jungcontroller),
                          jungganbo(widget.sheetVertical, jungcontroller,
                              testJungGanBo, controller.krChanges),
                          jungganboFromFlash(widget.sheetVertical,
                              jungcontroller, testJungGanBo),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
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
