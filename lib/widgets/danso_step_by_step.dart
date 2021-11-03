import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/controllers/flash_controller.dart';
import 'package:project_danso/widgets/danso_setp_make_flash_4_by_12.dart';
import 'package:project_danso/widgets/widgets.dart';

class DansoStepByStep extends StatelessWidget {
  String level;
  String currentLevel;
  DansoStepByStep({Key key, @required this.level, @required this.currentLevel});
  FlashController flashController;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(basicPadding),
        child: GetBuilder<DansoStepController>(
            init: DansoStepController(),
            builder: (controller) {
              return Column(
                children: [
                  Center(
                    child: Text(
                      '$currentLevel레벨 연습곡',
                      style: TextStyle(
                          fontSize: textSingleSize.sp, fontWeight: bold),
                    ),
                  ),
                  Stack(
                    children: [
                      jungganboFromLevel(level),
                      controller.starStopState
                          ? jungganboFromLevelFlash(controller)
                          : Container(),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 30.h,
                          width: 160.w,
                          child: ElevatedButton(
                              onPressed: () {
                                controller.changeStartStopState();
                                controller.starStopState
                                    ? controller.start()
                                    : controller.stop();
                              },
                              child: Text('${controller.startButton}'))),
                      Spacer(
                        flex: 1,
                      ),
                      Container(
                          height: 30.h,
                          width: 160.w,
                          child: ElevatedButton(
                              onPressed: () {
                                controller.starStopState
                                    ? null
                                    : controller.changespeedState();
                              },
                              child: Text(
                                  '${controller.speed[controller.speedCount]}배속'))),
                    ],
                  ),
                ],
              );
            }));
  }
}
