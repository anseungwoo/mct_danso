import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project_danso/common/const.dart';

class MyPageMusicController extends GetxController {
  bool starStopState = false;
  double currentSliderValue = 20;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  Icon startIcon = Icon(
    Icons.play_arrow,
    size: 40,
  );
  @override
  void onInit() async {
    await assetsAudioPlayer.open(
      Audio(backMusic),
      autoStart: false,
    );
    super.onInit();
  }

  void playMusic() async {
    assetsAudioPlayer.play();
  }

  @override
  void dispose() {
    assetsAudioPlayer.stop();
    super.dispose();
  }

  void currenrSliderValueChange(double value) {
    currentSliderValue = value;
    update();
  }

  void changeStartStopState() {
    starStopState = !starStopState;
    startIcon = starStopState
        ? Icon(
            Icons.pause,
            size: 40,
          )
        : Icon(
            Icons.play_arrow,
            size: 40,
          );
    update();
  }
}
