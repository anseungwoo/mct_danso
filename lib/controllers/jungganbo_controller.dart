import 'dart:async';

import 'package:danso_function/model/jung-gan-bo_model/JungGanBo.dart';
import 'package:get/get.dart';

class JungganboController extends GetxController {
  bool starStopState = false;
  String startButton = '시작하기';
  int speedCount = 2;
  List speed = [0.8, 0.9, 1.0, 1.1, 1.2];
  bool krState = false;
  String krButton = "한자";
  int next = 0;
  int next2 = 0;
  late int mill;
  late JungGanBo jungGanBo;
  late int sheetHorizontal;
  bool gameState = false;
  @override
  void onInit() {
    super.onInit();
    stepStop();
  }

  void changegameState() {
    gameState = !gameState;

    update();
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

  int line = 0;
  int row = 0;
  void stepStop() {
    line = 0;
    next = 0;
    next2 = 0;
    row = 0;
    starStopState = false;
    startButton = '시작하기';
  }

  void stepStart() {
    interval(Duration(milliseconds: mill), (timer) {
      if (line < jungGanBo.sheet.length &&
          row == jungGanBo.sheet[line].yulmyeongs.length - 1) {
        line++;
        row = 0;
      } else {
        row++;
      }
      if (starStopState == false) {
        timer.cancel();
        stepStop();
        return;
      }
      if (line == jungGanBo.sheet.length) {
        stepStop();
      }
      update();
    });
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
