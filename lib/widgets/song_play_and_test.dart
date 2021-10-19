import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/song_audio_recorder.dart';
import 'package:project_danso/widgets/tabbar_and_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/widgets/widgets.dart';

class SongPlayAndTest extends StatefulWidget {
  const SongPlayAndTest({Key key}) : super(key: key);

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
    return Scaffold(
      appBar: songtabbarAndAppBar(
          title: "노래곡1 제목", tabbar: null, enableTabBar: false),
      body: GetBuilder<PlayAndTestController>(
          init: PlayAndTestController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(basicPadding),
              child: Column(
                children: [
                  Container(
                    // height: 30.h,
                    width: 330.w,
                    child: Stack(
                      children: [
                        controller.statecount == 0
                            ? Row(
                                children: [
                                  songSwapButton(
                                    text: Text(controller.buttonSwap),
                                    onPressed: () {
                                      controller.changePlayStopState();
                                      controller.nextButton();
                                      print(controller.statecount);
                                    },
                                  ),
                                  SizedBox(width: 5),
                                  controller.platState
                                      ? Container()
                                      : songSwapButton(
                                          text: Text(controller.testButtonswap),
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
                                        controller.speedState();
                                      }),
                                ],
                              )
                            : controller.statecount == 1
                                ? songSwapButton(
                                    text: Text(controller.buttonSwap),
                                    onPressed: () {
                                      controller.changePlayStopState();
                                      controller.previousButton();
                                      print(controller.statecount);
                                    },
                                  )
                                : controller.statecount == 2
                                    ? Row(
                                        children: [
                                          songSwapButton(
                                            text: Text(controller.buttonSwap),
                                            onPressed: () {
                                              controller.testStartButtonState();
                                              controller.nextButton();
                                              print(controller.statecount);
                                            },
                                          ),
                                          SizedBox(width: 5),
                                          songSwapButton(
                                              text: Text("녹음"),
                                              onPressed: () {
                                                controller.stateCountUp(5);
                                                print(controller.statecount);
                                              }),
                                          SizedBox(width: 5),
                                          songSwapButton(
                                              text: Text(
                                                  controller.testButtonswap),
                                              onPressed: () {
                                                controller.stateCountUp(4);
                                                _onPressed(context);
                                                print(controller.statecount);
                                              }),
                                          SizedBox(width: 5),
                                          songSwapButton(
                                              text: Text(
                                                  "${controller.speed[controller.speedCount]} 배속"),
                                              onPressed: () {
                                                controller.speedState();
                                              }),
                                        ],
                                      )
                                    : controller.statecount == 3
                                        ? Row(
                                            children: [
                                              songSwapButton(
                                                text:
                                                    Text(controller.buttonSwap),
                                                onPressed: () {
                                                  controller.reset();
                                                  controller.stateCountUp(0);
                                                  print(controller.statecount);
                                                },
                                              ),
                                              SizedBox(width: 5),
                                              songSwapButton(
                                                  text: Text(controller
                                                      .testButtonswap),
                                                  onPressed: () {
                                                    print(
                                                        controller.statecount);
                                                  }),
                                            ],
                                          )
                                        : controller.statecount == 4
                                            ? SongCamaraRecoding(
                                                controller: controller)
                                            : controller.statecount == 5
                                                ? SongAudioRecorder(
                                                    controller: controller)
                                                : Container(),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text("${controller.speed[controller.speedCount]} 배속"),
                      Spacer(flex: 1),
                      Text("자진모리장단")
                    ],
                  ),
                  Container(
                      color: white,
                      width: 330.w,
                      height: 440.h,
                      child: Row(
                        children: [
                          vertcal(),
                          SizedBox(width: 13.w),
                          vertcal(),
                          SizedBox(width: 13.w),
                          vertcal(),
                          SizedBox(width: 13.w),
                          vertcal(),
                          SizedBox(width: 13.w),
                          vertcal(),
                        ],
                      ))
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
                      "녹화화면을 준비하고 있습니다.",
                      style: TextStyle(color: white, fontSize: textContantSize),
                    ),
                    Text(
                      "녹화시작 버튼을 누르고 녹화시작",
                      style: TextStyle(color: white, fontSize: textContantSize),
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

  Column vertcal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 55,
          height: 35,
          decoration: BoxDecoration(border: Border.all(color: textBlack)),
        ),
        Container(
          width: 55,
          height: 35,
          decoration: BoxDecoration(border: Border.all(color: textBlack)),
        ),
        Container(
          width: 55,
          height: 35,
          decoration: BoxDecoration(border: Border.all(color: textBlack)),
        ),
        Container(
          width: 55,
          height: 35,
          decoration: BoxDecoration(border: Border.all(color: textBlack)),
        ),
        Container(
          width: 55,
          height: 35,
          decoration: BoxDecoration(border: Border.all(color: textBlack)),
        ),
        Container(
          width: 55,
          height: 35,
          decoration: BoxDecoration(border: Border.all(color: textBlack)),
        ),
        Container(
          width: 55,
          height: 35,
          decoration: BoxDecoration(border: Border.all(color: textBlack)),
        ),
        Container(
          width: 55,
          height: 35,
          decoration: BoxDecoration(border: Border.all(color: textBlack)),
        ),
        Container(
          width: 55,
          height: 35,
          decoration: BoxDecoration(border: Border.all(color: textBlack)),
        ),
        Container(
          width: 55,
          height: 35,
          decoration: BoxDecoration(border: Border.all(color: textBlack)),
        ),
        Container(
          width: 55,
          height: 35,
          decoration: BoxDecoration(border: Border.all(color: textBlack)),
        ),
        Container(
          width: 55,
          height: 35,
          decoration: BoxDecoration(border: Border.all(color: textBlack)),
        ),
        Container(
          width: 55,
          height: 35,
          decoration: BoxDecoration(border: Border.all(color: textBlack)),
        ),
        Container(
          width: 55,
          height: 35,
          decoration: BoxDecoration(border: Border.all(color: textBlack)),
        ),
      ],
    );
  }

  ElevatedButton songSwapButton({Widget text, Function() onPressed}) {
    return ElevatedButton(
      child: text,
      onPressed: onPressed,
    );
  }
}
