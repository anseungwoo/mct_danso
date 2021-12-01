import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/utils/danso_function.dart';
import 'package:project_danso/widgets/widgets.dart';

import 'jungganbo/jungganbo_screen.dart';

class SongPlayAndTest extends StatefulWidget {
  final String appbarTitle;
  final String sheetData;
  final String jangdan;
  final int sheetVertical;
  final int sheetHorizontal;

  SongPlayAndTest(
      {Key? key,
      required this.appbarTitle,
      required this.jangdan,
      required this.sheetData,
      required this.sheetVertical,
      required this.sheetHorizontal})
      : super(key: key);

  // final songData = Get.arguments;

  @override
  _SongPlayAndTestState createState() => _SongPlayAndTestState();
}

class _SongPlayAndTestState extends State<SongPlayAndTest> {
  late int percent;
  JungGanBoPlayer jungGanBoPlayer = JungGanBoPlayer();
  JungganboController jungganboController = JungganboController();
  FlutterMidi flutterMidi = FlutterMidi();
  Future _incrementCounter() async {
    return Future.delayed(Duration(seconds: 4), () {});
  }

  void _onPressed(BuildContext context) async {
    showLoadingIndicator(context);
    await _incrementCounter();
    hideOpenDialog();
  }

  @override
  Widget build(BuildContext context) {
    jungganboController.sheetHorizontal = widget.sheetHorizontal;
    var testJungGanBo =
        JungGanBo(widget.appbarTitle, widget.jangdan, widget.sheetData);
    return Scaffold(
      appBar: songtabbarAndAppBar(
          title: '${widget.appbarTitle}', tabbar: null, enableTabBar: false),
      body: GetBuilder<PlayAndTestController>(
          init: PlayAndTestController(),
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // height: 30.h,
                  child: GetBuilder<JungganboController>(
                      init: jungganboController,
                      builder: (jungcontroller) {
                        jungcontroller.mill = testJungGanBo.jangDan.milliSecond;
                        jungcontroller.jungGanBo = testJungGanBo;
                        jungcontroller.sheetVertical = widget.sheetVertical;
                        return Container(
                          width: 340.w,
                          child: Stack(
                            children: [
                              controller.statecount == 0
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        songSwapButton(
                                          text: Text(
                                              controller.challengeButtonSwap),
                                          onPressed: () {
                                            controller.changePlayStopState();
                                            controller.nextButton();
                                            jungcontroller
                                                .changeStartStopState();
                                            controller.platState
                                                ? jungcontroller.stepStart()
                                                : jungcontroller.stepStop();
                                            jungcontroller.startStopState
                                                ? jungGanBoPlayer
                                                    .play(testJungGanBo)
                                                : null;

                                            print(controller.statecount);
                                          },
                                        ),
                                        SizedBox(width: 5.w),
                                        controller.platState
                                            ? Container()
                                            : songSwapButton(
                                                text: Text(
                                                    controller.testButtonswap,
                                                    style: TextStyle(
                                                        fontSize:
                                                            textSmallSize.sp)),
                                                onPressed: () {
                                                  controller.testButtonState();
                                                  controller.stateCountUp(2);
                                                  print(controller.statecount);
                                                }),
                                        SizedBox(width: 5.w),
                                        songSwapButton(
                                            text: Text(
                                                "${controller.speed[controller.speedCount]} 배속",
                                                style: TextStyle(
                                                    fontSize:
                                                        textSmallSize.sp)),
                                            onPressed: () {
                                              controller.changespeedState();
                                            }),
                                        SizedBox(width: 5.w),
                                        songSwapButton(
                                            text: Text(controller.krButton,
                                                style: TextStyle(
                                                    fontSize:
                                                        textSmallSize.sp)),
                                            onPressed: () {
                                              controller.changeKrState();
                                            }),
                                      ],
                                    )
                                  : controller.statecount == 1
                                      ? songSwapButton(
                                          text: Text(
                                            controller.challengeButtonSwap,
                                            style: TextStyle(
                                                fontSize: textSmallSize.sp),
                                          ),
                                          onPressed: () {
                                            controller.changePlayStopState();

                                            controller.previousButton();
                                            jungcontroller
                                                .changeStartStopState();
                                            controller.platState
                                                ? null
                                                : jungcontroller.stepStop();
                                            print(controller.statecount);
                                          },
                                        )
                                      : controller.statecount == 2
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                songSwapButton(
                                                  text: Text(
                                                      controller
                                                          .challengeButtonSwap,
                                                      style: TextStyle(
                                                          fontSize:
                                                              textSmallSize
                                                                  .sp)),
                                                  onPressed: () {
                                                    controller
                                                        .testStartButtonState();
                                                    jungcontroller
                                                        .changeStartStopState();
                                                    controller.testStartState
                                                        ? jungcontroller
                                                            .stepStart()
                                                        : null;
                                                    jungcontroller
                                                            .startStopState
                                                        ? jungGanBoPlayer
                                                            .play(testJungGanBo)
                                                        : null;
                                                    controller.nextButton();
                                                    print(
                                                        controller.statecount);
                                                  },
                                                ),
                                                SizedBox(width: 5),
                                                songSwapButton(
                                                    text: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        SvgPicture.asset(
                                                          TRANSCRIPTION_SVG,
                                                          width: 13.w,
                                                          height: 13.h,
                                                        ),
                                                        Text("녹음",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    textSmallSize
                                                                        .sp)),
                                                      ],
                                                    ),
                                                    onPressed: () {
                                                      controller
                                                          .stateCountUp(5);
                                                      print(controller
                                                          .statecount);
                                                    }),
                                                SizedBox(width: 5),
                                                songSwapButton(
                                                    text: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        SvgPicture.asset(
                                                          RECORD_SVG,
                                                          width: 20.w,
                                                          height: 20.h,
                                                        ),
                                                        Text(
                                                            controller
                                                                .testButtonswap,
                                                            style: TextStyle(
                                                                fontSize:
                                                                    textSmallSize
                                                                        .sp)),
                                                      ],
                                                    ),
                                                    onPressed: () {
                                                      controller
                                                          .stateCountUp(4);
                                                      _onPressed(context);
                                                      print(controller
                                                          .statecount);
                                                    }),
                                              ],
                                            )
                                          : controller.statecount == 3
                                              ? Row(
                                                  children: [
                                                    songSwapButton(
                                                      text: Text(
                                                          controller
                                                              .challengeButtonSwap,
                                                          style: TextStyle(
                                                              fontSize:
                                                                  textSmallSize
                                                                      .sp)),
                                                      onPressed: () {
                                                        controller.reset();
                                                        jungcontroller
                                                            .changeStartStopState();
                                                        controller
                                                                .testStartState
                                                            ? null
                                                            : jungcontroller
                                                                .stepStop();
                                                        controller
                                                            .stateCountUp(0);
                                                        print(controller
                                                            .statecount);
                                                      },
                                                    ),
                                                    SizedBox(width: 5),
                                                    songSwapButton(
                                                        text: Text(
                                                            controller
                                                                .testButtonswap,
                                                            style: TextStyle(
                                                                fontSize:
                                                                    textSmallSize
                                                                        .sp)),
                                                        onPressed: () {
                                                          print(controller
                                                              .statecount);
                                                        }),
                                                  ],
                                                )
                                              : controller.statecount == 4
                                                  ? SongCamaraRecoding(
                                                      controller:
                                                          jungcontroller,
                                                      jandan: widget.jangdan,
                                                    )
                                                  : controller.statecount == 5
                                                      ? SongAudioRecorder(
                                                          controller:
                                                              jungcontroller)
                                                      : Container(),
                            ],
                          ),
                        );
                      }),
                ),
                controller.statecount == 4
                    ? SizedBox(
                        height: 5,
                      )
                    : Container(
                        width: 335.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${controller.speed[controller.speedCount]} 배속',
                              style: TextStyle(
                                  fontSize: textSmallSize.sp,
                                  fontFamily: NOTO_REGULAR),
                            ),
                            Text(
                              '${widget.jangdan}',
                              style: TextStyle(
                                  fontSize: textSmallSize.sp,
                                  fontFamily: NOTO_REGULAR),
                            )
                          ],
                        ),
                      ),
                Container(
                  margin: EdgeInsets.only(right: textSmallSize.w),
                  // color: Colors.white,
                  // width: ScreenUtil().screenWidth,
                  // alignment: Alignment.center,
                  child: GetBuilder<JungganboController>(
                      init: jungganboController,
                      builder: (jungcontroller) {
                        return Stack(
                          children: [
                            jungganboScreen(
                                widget.sheetVertical, jungcontroller),
                            jungganbo(widget.sheetVertical, jungcontroller,
                                testJungGanBo, controller.krChanges),
                            jungganboFromFlash(widget.sheetVertical,
                                jungcontroller, testJungGanBo),
                          ],
                        );
                      }),
                ),
              ],
            );
          }),
    );
  }

  void showLoadingIndicator(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black.withOpacity(0),
          content: Center(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(white),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '녹화화면을 준비하고 있습니다',
                      style: TextStyle(color: white, fontSize: textEightSize),
                    ),
                    Text(
                      '녹화시작 버튼을 누르고 녹화시작',
                      style: TextStyle(color: white, fontSize: textEightSize),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void hideOpenDialog() {
    Get.back();
  }

  Widget songSwapButton({Widget? text, Function()? onPressed}) {
    return Container(
      width: 81.w,
      height: 30.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: white,
            onPrimary: buttonColorOrang,
            side: BorderSide(color: buttonColorOrang),
            textStyle: TextStyle(
                fontSize: textSmallSize.sp,
                color: buttonColorOrang,
                fontFamily: NOTO_REGULAR)),
        onPressed: onPressed,
        child: text,
      ),
    );
  }
}
