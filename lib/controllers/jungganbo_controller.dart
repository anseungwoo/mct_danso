import 'dart:async';

import 'package:get/get.dart';

class JungganboController extends GetxController {
  bool starStopState = false;
  String startButton = '시작하기';
  int speedCount = 2;
  List speed = [0.8, 0.9, 1.0, 1.1, 1.2];
  bool krState = false;
  String krButton = "한자";

  @override
  void onInit() {
    super.onInit();
    starStopState = false;
    startButton = '시작하기';
    stepStop();
  }

  void changekrState() {
    krState = !krState;
    krButton = krState ? '한글' : '한자';
    update();
  }

  void changeStartStopState() {
    starStopState = !starStopState;
    startButton = starStopState ? '종료하기' : '시작하기';
    update();
  }

  void changespeedState() {
    speedCount++;
    if (speedCount == 5) {
      speedCount = 0;
    }
    update();
  }

  int i = 0;
  int flashcount = -1;
  int flashcount2 = -1;

  int j = 0;
  void stepStop() {
    flashcount = -1;
    i = 0;

    j = 0;
    update();
  }

  void stepStart(int mill) {
    interval(Duration(milliseconds: mill), (timer) {
      if (i < 48 && starStopState) {
        flashCount();
        i++;
      } else {
        timer.cancel();
        stepStop();
        return;
      }
    });

    update();
  }

  void flashCount2() {
    flashcount2++;
    update();
  }

  void flashCount() {
    flashcount++;
    update();
  }

  Timer interval(Duration duration, func) {
    Timer function() {
      Timer timer = Timer(duration, function);

      func(timer);

      return timer;
    }

    return Timer(duration, function);
  }
}
