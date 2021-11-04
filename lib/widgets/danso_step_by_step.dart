import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/widgets.dart';

class DansoStepByStep extends StatefulWidget {
  final String level;
  final String currentLevel;

  DansoStepByStep({Key key, @required this.level, @required this.currentLevel});

  @override
  _DansoStepByStepState createState() => _DansoStepByStepState();
}

class _DansoStepByStepState extends State<DansoStepByStep> {
  final dansoStepController = Get.put(DansoStepController());

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
    dansoStepController.starStopState = false;
  }

  @override
  void initState() {
    super.initState();
    print('iniit');
    dansoStepController.starStopState = false;
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
    dansoStepController.starStopState = false;
  }

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
                      '${widget.currentLevel}레벨 연습곡',
                      style: TextStyle(
                          fontSize: textSingleSize.sp, fontWeight: bold),
                    ),
                  ),
                  jungganboFromLevel(widget.level),
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
