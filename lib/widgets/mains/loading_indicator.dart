import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  late Timer _timer;
  double progressValue = 0;
  var controller = Get.find<MainScreenController>();

  final DansoSoundLearningController dansoSoundLearningController =
      Get.put(DansoSoundLearningController());

  _LoadingIndicatorState() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (Timer _timer) {
      setState(() {
        progressValue++;
        if (progressValue == 75) {
          _timer.cancel();
          dansoSoundLearningController.changeSoundTuningState();
          // dansoSoundLearningController.stopAdjust();
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
    // dansoSoundLearningController.detector.stopRecording();

    _timer2.cancel();

    if (controller.musicState.value) {
      // controller.assetsAudioPlayer.play();
      controller.player.play();
    }
    super.dispose();
  }

  late Timer _timer2;
  int _start = 4;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(milliseconds: 1000);
    _timer2 = Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          Navigator.pop(context);
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 200.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 120.h,
            width: 120.w,
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 75,
                  showLabels: false,
                  showTicks: false,
                  startAngle: 270,
                  endAngle: 270,
                  radiusFactor: 0.8,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.05,
                    color: Colors.white,
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: <GaugePointer>[
                    //239, 190, 80
                    RangePointer(
                      color: MctColor.unButtonColorOrange.getMctColor,
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$_start초간 단소로 태(汰) 불어주세요.',
              style: TextStyle(fontSize: MctSize.fifteen.getSize.sp),
            ),
          ),
        ],
      ),
    );
  }
}
