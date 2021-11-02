import 'package:get/get.dart';

class DansoSoundLearningController extends GetxController {
  bool soundTuningState = false;
  bool listenTunungState = false;
  bool playTunungState = false;

  String buttonSound = '기준음 잡기';
  String buttonListen = '예시듣기';
  String buttonPlay = '불어보기';
  int soundListUpDown = 0;
  List soundList = ['중', '임', '무', '황', '태'];
  List soundList1 = ['仲', '林', '無', '潢', '汰'];

  int listsize = 20;
  void changeSoundTuningState() {
    soundTuningState = !soundTuningState;
    buttonSound = soundTuningState ? '종료하기' : '기준음 잡기';
    update();
  }

  void changePlayState() {
    playTunungState = !playTunungState;
    buttonPlay = playTunungState ? '종료하기' : '불어보기';
    update();
  }

  void changeSpeakTuningState() {
    listenTunungState = !listenTunungState;
    buttonListen = listenTunungState ? '종료하기' : '예시듣기';
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

  void soundListTa(int n) {
    soundListUpDown = 4;

    update();
  }
}
