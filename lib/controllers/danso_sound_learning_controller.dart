import 'package:get/get.dart';

class DansoSoundLearningController extends GetxController {
  bool soundTuningState = false;
  String buttonTitle = '소리조율';

  void changeSoundTuningState() {
    soundTuningState = !soundTuningState;
    buttonTitle = soundTuningState ? '종료하기' : '소리조율';
    update();
  }
}
