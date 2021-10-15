import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/tabbar_and_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/widgets/widgets.dart';

class SongPlayAndTest extends StatefulWidget {
  const SongPlayAndTest({Key key}) : super(key: key);

  @override
  _SongPlayAndTestState createState() => _SongPlayAndTestState();
}

class _SongPlayAndTestState extends State<SongPlayAndTest> {
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
                                              text: Text(
                                                  controller.testButtonswap),
                                              onPressed: () {
                                                controller.stateCountUp(4);
                                                print(controller.statecount);
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
                                                  controller
                                                      .testStartButtonState();
                                                  controller.previousButton();
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
                                            ? SongCamaraRecoding()
                                            : Container()
                      ],
                    ),
                  ),
                  Row(
                    children: [Text("1.0배속"), Spacer(flex: 1), Text("자진모리장단")],
                  ),
                  Container(
                      color: Colors.amber,
                      width: 330.w,
                      height: 440.h,
                      child: Text("정간보"))
                ],
              ),
            );
          }),
    );
  }

  ElevatedButton songSwapButton({Widget text, Function() onPressed}) {
    return ElevatedButton(
      child: text,
      onPressed: onPressed,
    );
  }
}
