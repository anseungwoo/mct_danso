import 'dart:async';

import 'package:danso_function/danso_function.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class DansoSoundLearningController extends GetxController {
  bool soundTuningState = false;
  bool listenTunungState = false;
  bool playTunungState = false;
  PitchModel pitchModel;
  String buttonSound = '기준음 잡기';
  String buttonListen = '예시듣기';
  String buttonPlay = '불어보기';
  int soundListUpDown = 0;
  List soundList = [
    '중',
    '임',
    '무',
    '황',
    '태',
    '높은 중',
    '높은 임',
    '높은 무',
    '높은 황',
    '높은 태',
  ];
  List soundList1 = ['仲', '林', '無', '潢', '汰', '㳞', '淋', '潕', '㶂', '㳲'];
  final _flutterMidi = FlutterMidi();
  @override
  void onInit() {
    load('assets/Dan.sf2');
    super.onInit();
  }

  void load(String asset) async {
    print('Loading File...');
    _flutterMidi.unmute();
    ByteData _byte = await rootBundle.load(asset);
    //assets/sf2/SmallTimGM6mb.sf2
    //assets/sf2/Piano.SF2
    _flutterMidi.prepare(sf2: _byte, name: "hi");
  }

  void palySound() {
    switch (soundListUpDown) {
      case 0:
        playOneYulmyeongNote(
            YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin), 2000);
        break;
      case 1:
        playOneYulmyeongNote(
            YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin), 2000);
        break;
      case 2:
        playOneYulmyeongNote(
            YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin), 2000);
        break;
      case 3:
        playOneYulmyeongNote(
            YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin), 2000);
        break;
      case 4:
        playOneYulmyeongNote(
            YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin), 2000);
        break;
      case 5:
        playOneYulmyeongNote(
            YulmyeongNote(Yulmyeong.joong, ScaleStatus.high), 2000);
        break;
      case 6:
        playOneYulmyeongNote(
            YulmyeongNote(Yulmyeong.yim, ScaleStatus.high), 2000);
        break;
      case 7:
        playOneYulmyeongNote(
            YulmyeongNote(Yulmyeong.moo, ScaleStatus.high), 2000);
        break;
      case 8:
        playOneYulmyeongNote(
            YulmyeongNote(Yulmyeong.hwang, ScaleStatus.high), 2000);
        break;
      case 9:
        playOneYulmyeongNote(
            YulmyeongNote(Yulmyeong.tae, ScaleStatus.high), 2000);
        break;
      default:
    }
  }

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
