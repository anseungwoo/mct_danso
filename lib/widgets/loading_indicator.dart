import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({Key key}) : super(key: key);

  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  Timer _timer;
  double progressValue = 0;

  final DansoSoundLearningController dansoSoundLearningController =
      Get.put(DansoSoundLearningController());

  _LoadingIndicatorState() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (Timer _timer) {
      setState(() {
        progressValue++;
        if (progressValue == 50) {
          _timer.cancel();
          dansoSoundLearningController.changeSoundTuningState();
          dansoSoundLearningController.stopAdjust();
          print(dansoSoundLearningController.dansoPitchAdjustList);
          Get.back();
        }
      });
    });
  }

  @override
  void dispose() {
    // dansoSoundLearningController.stopAdjust();
    dansoSoundLearningController.soundTuningState = false;
    dansoSoundLearningController.isAdjust = false;
    dansoSoundLearningController.detector.stopRecording();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      height: 330.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(BOLW_SVG),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("5초간 태(汰) 불어주세요"),
          ),
          Container(
              height: 120,
              width: 120,
              child: SfRadialGauge(axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 50,
                  showLabels: false,
                  showTicks: false,
                  startAngle: 270,
                  endAngle: 270,
                  radiusFactor: 0.8,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.05,
                    color: const Color.fromARGB(100, 0, 169, 181),
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      value: progressValue,
                      width: 0.95,
                      pointerOffset: 0.05,
                      sizeUnit: GaugeSizeUnit.factor,
                      enableAnimation: true,
                      animationType: AnimationType.linear,
                      animationDuration: 50,
                    )
                  ],
                )
              ])),
        ],
      ),
    );
  }
}
