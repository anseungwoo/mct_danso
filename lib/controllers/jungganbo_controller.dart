import 'dart:async';

import 'package:danso_function/model/jung-gan-bo_model/JungGanBo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class JungganboController extends GetxController {
  bool startStopState = false;
  String startButton = '시작하기';
  int speedCount = 2;
  List speed = [0.8, 0.9, 1.0, 1.1, 1.2];
  bool krState = false;
  String krButton = '한자';

  late int mill;
  late JungGanBo jungGanBo;

  late int sheetVertical;
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
    startStopState = !startStopState;
    startButton = startStopState ? '종료하기' : '시작하기';
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
  int jungSection = 0;
  int next = 0;
  int next2 = 0;
  int pagenext = 1;
  int sheetHorizontal = 0;
  int copySheetHorizontal = 0;

  void stepStop() {
    pagenext = 1;
    line = 0;
    next = 0;
    next2 = 0;
    jungSection = 0;
    startStopState = false;
    copySheetHorizontal = sheetHorizontal;
    startButton = '시작하기';
  }

  void stepStart() async {
    print('결과값 $copySheetHorizontal');
    await Future.delayed(Duration(milliseconds: mill));
    for (line; line < jungGanBo.sheet.length - 1; line++) {
      if (line != 31 * pagenext || line != 23 * pagenext) {
        await Future.delayed(Duration(milliseconds: (mill - 3).toInt()));
        update();
      }

      if (copySheetHorizontal >= 4 &&
          line == 31 * pagenext &&
          sheetVertical == 8) {
        next += 4;
        next2 += 4;
        pagenext++;
        copySheetHorizontal -= 2;

        print('결과값4 $copySheetHorizontal');
        print('n1 $next');
        print('n2 $next2');
        print('np $pagenext');
      }
      if (copySheetHorizontal >= 4 &&
          line == 23 * pagenext &&
          sheetVertical == 6) {
        next += 4;
        next2 += 4;
        pagenext++;
        copySheetHorizontal -= 2;

        print('결과값4 $copySheetHorizontal');
        print('n1 $next');
        print('n2 $next2');
        print('np $pagenext');
      }
      if (copySheetHorizontal == 3 &&
          line == 23 * pagenext &&
          sheetVertical == 6) {
        next += 4;
        next2 += 2;
        pagenext++;

        print('결과값3 $copySheetHorizontal');
        print('n1 $next');
        print('n2 $next2');
        print('np $pagenext');
      }
      if (copySheetHorizontal == 3 &&
          line == 31 * pagenext &&
          sheetVertical == 8) {
        next += 4;
        next2 += 2;
        pagenext++;

        print('결과값3 $copySheetHorizontal');
        print('n1 $next');
        print('n2 $next2');
        print('np $pagenext');
      }

      if (startStopState == false || line == jungGanBo.sheet.length - 1) {
        stepStop();
      }
      update();
    }
    update();
  }
}
