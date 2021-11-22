import 'dart:async';
import 'package:danso_function/danso_function.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  JungGanBoPlayer jungGanBoPlayer = new JungGanBoPlayer();
  JungganboController jungganboController = JungganboController();
  Future _incrementCounter() async {
    return Future.delayed(Duration(seconds: 4), () {});
  }

  @override
  void initState() {
    super.initState();
  }

  void _onPressed(BuildContext context) async {
    showLoadingIndicator(context);
    await _incrementCounter();
    hideOpenDialog();
  }

  @override
  Widget build(BuildContext context) {
    jungganboController.sheetHorizontal = widget.sheetHorizontal;
    JungGanBo testJungGanBo =
        new JungGanBo(widget.appbarTitle, widget.jangdan, widget.sheetData);
    return Scaffold(
      appBar: songtabbarAndAppBar(
          title: '${widget.appbarTitle}', tabbar: null, enableTabBar: false),
      body: GetBuilder<PlayAndTestController>(
          init: PlayAndTestController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: basicPadding),
              child: Column(
                children: [
                  Container(
                    // height: 30.h,
                    width: 330.w,
                    child: GetBuilder<JungganboController>(
                        init: jungganboController,
                        builder: (jungcontroller) {
                          jungcontroller.mill =
                              testJungGanBo.jangDan.milliSecond;
                          jungcontroller.jungGanBo = testJungGanBo;
                          jungcontroller.sheetVertical = widget.sheetVertical;
                          return Stack(
                            children: [
                              controller.statecount == 0
                                  ? Row(
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
                                            // jungcontroller.starStopState
                                            //     ? jungGanBoPlayer
                                            //         .play(testJungGanBo)
                                            //     : null;

                                            print(controller.statecount);
                                          },
                                        ),
                                        SizedBox(width: 5),
                                        controller.platState
                                            ? Container()
                                            : songSwapButton(
                                                text: Text(
                                                    controller.testButtonswap),
                                                onPressed: () {
                                                  controller.testButtonState();
                                                  controller.stateCountUp(2);
                                                  print(controller.statecount);
                                                }),
                                        SizedBox(width: 5),
                                        songSwapButton(
                                            text: Text(
                                                "${controller.speed[controller.speedCount]} 배속"),
                                            onPressed: () {
                                              controller.changespeedState();
                                            }),
                                        SizedBox(width: 5),
                                        songSwapButton(
                                            text: Text(controller.krButton),
                                            onPressed: () {
                                              controller.changeKrState();
                                            }),
                                      ],
                                    )
                                  : controller.statecount == 1
                                      ? songSwapButton(
                                          text: Text(
                                              controller.challengeButtonSwap),
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
                                              children: [
                                                songSwapButton(
                                                  text: Text(controller
                                                      .challengeButtonSwap),
                                                  onPressed: () {
                                                    controller
                                                        .testStartButtonState();
                                                    jungcontroller
                                                        .changeStartStopState();
                                                    controller.testStartState
                                                        ? jungcontroller
                                                            .stepStart()
                                                        : null;
                                                    // jungcontroller.starStopState
                                                    //     ? jungGanBoPlayer
                                                    //         .play(testJungGanBo)
                                                    //     : null;
                                                    controller.nextButton();
                                                    print(
                                                        controller.statecount);
                                                  },
                                                ),
                                                SizedBox(width: 5),
                                                songSwapButton(
                                                    text: Text("녹음"),
                                                    onPressed: () {
                                                      controller
                                                          .stateCountUp(5);
                                                      print(controller
                                                          .statecount);
                                                    }),
                                                SizedBox(width: 5),
                                                songSwapButton(
                                                    text: Text(controller
                                                        .testButtonswap),
                                                    onPressed: () {
                                                      controller
                                                          .stateCountUp(4);
                                                      _onPressed(context);
                                                      print(controller
                                                          .statecount);
                                                    }),
                                                SizedBox(width: 5),
                                                songSwapButton(
                                                    text: Text(
                                                        "${controller.speed[controller.speedCount]} 배속"),
                                                    onPressed: () {
                                                      controller
                                                          .changespeedState();
                                                    }),
                                              ],
                                            )
                                          : controller.statecount == 3
                                              ? Row(
                                                  children: [
                                                    songSwapButton(
                                                      text: Text(controller
                                                          .challengeButtonSwap),
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
                                                        text: Text(controller
                                                            .testButtonswap),
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
                          );
                        }),
                  ),
                  controller.statecount == 4
                      ? SizedBox(
                          height: 5,
                        )
                      : Row(
                          children: [
                            Text(
                                "${controller.speed[controller.speedCount]} 배속"),
                            Spacer(flex: 1),
                            Text("${widget.jangdan}")
                          ],
                        ),
                  GetBuilder<JungganboController>(
                      init: jungganboController,
                      builder: (jungcontroller) {
                        return Container(
                          width: (jungWidth.w + 20.w) * 4.w,
                          height: jungEightHeight.w * 9.w,
                          color: white,
                          child: Stack(
                            children: [
                              jungganbo(widget.sheetVertical, jungcontroller,
                                  testJungGanBo, controller.krChanges),
                              jungganboFromFlash(widget.sheetVertical,
                                  jungcontroller, testJungGanBo),
                              jungganboScreen(
                                  widget.sheetVertical, jungcontroller),
                            ],
                          ),
                        );
                      }),
                ],
              ),
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
                      "녹화화면을 준비하고 있습니다",
                      style: TextStyle(color: white, fontSize: textEightSize),
                    ),
                    Text(
                      "녹화시작 버튼을 누르고 녹화시작",
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
      width: 78.w,
      height: 30.h,
      child: ElevatedButton(
        child: text,
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(fontSize: textSmallSize)),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
