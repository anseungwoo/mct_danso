import 'dart:async';
import 'package:danso_function/danso_function.dart';
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
  final int sheetLength;

  SongPlayAndTest(
      {Key key,
      this.appbarTitle,
      this.jangdan,
      this.sheetData,
      this.sheetLength})
      : super(key: key);

  // final songData = Get.arguments;

  @override
  _SongPlayAndTestState createState() => _SongPlayAndTestState();
}

class _SongPlayAndTestState extends State<SongPlayAndTest> {
  int percent;

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
                        init: JungganboController(),
                        builder: (jungcontroller) {
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
                                                ? jungcontroller.stepStart(
                                                    testJungGanBo
                                                        .jangDan.milliSecond)
                                                : jungcontroller.stepStop();

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
                                                      controller: controller)
                                                  : controller.statecount == 5
                                                      ? SongAudioRecorder(
                                                          controller:
                                                              controller)
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
                      init: JungganboController(),
                      builder: (jungcontroller) {
                        return Stack(
                          children: [
                            // jungganbo(6, testJungGanBo),
                            // controller.platState
                            //     ? jungganboFromFlash(
                            //         6, Get.find<JungganboController>(), testJungGanBo)
                            //     : Container(),

                            jungganbo(widget.sheetLength, jungcontroller,
                                testJungGanBo, controller.krChanges),
                            jungganboFromFlash(widget.sheetLength,
                                jungcontroller, testJungGanBo),
                            jungganboScreen(widget.sheetLength),
                            // JungganboColorAnimation(
                            //   tempo: 1000,
                            //   jungganboLength: 8,
                            // ),
                          ],
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

  Widget songSwapButton({Widget text, Function() onPressed}) {
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
