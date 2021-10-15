import 'dart:ffi';

import 'package:get/get.dart';

class DansoSoundLearningController extends GetxController {
  bool soundTuningState = false;
  String buttonTitle = '소리내기';
  int soundListUpDown = 0;
  List soundList = ["중", "임", "무", "황", "태"];
  int test = 0;
  List list1 = ["2", '2,2', '22222', "23232"];
  int listsize = 20;
  void changeSoundTuningState() {
    soundTuningState = !soundTuningState;
    buttonTitle = soundTuningState ? '종료하기' : '소리내기';
    update();
  }

  void soundListUp() {
    if (soundListUpDown < soundList.length - 1) {
      soundListUpDown++;
    }
    update();
  }

  void soundListDown() {
    if (0 < soundListUpDown) {
      soundListUpDown--;
    }
    update();
  }

  void nextpage() {
    if (test < 1) {
      test++;
    }

    update();
  }

  void previouspage() {
    if (test > 0) {
      test--;
    }

    update();
  }
}
