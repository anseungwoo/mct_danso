import 'package:get/get.dart';

class DansoSoundLearningController extends GetxController {
  bool soundTuningState = false;
  String buttonTitle = '소리조율';
  int soundListUpDown = 0;
  List soundList = ["중", "임", "무", "황", "태"];
  void changeSoundTuningState() {
    soundTuningState = !soundTuningState;
    buttonTitle = soundTuningState ? '종료하기' : '소리조율';
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
}
