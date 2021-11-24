import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:audio_session/audio_session.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:project_danso/common/const.dart';
import 'package:rxdart/rxdart.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MainScreenController extends GetxController with WidgetsBindingObserver {
  bool svgState = false;
  bool musicState = false;
  bool muteButtonState = true;

  // AudioPlayer player = AudioPlayer();
  final assetsAudioPlayer = AssetsAudioPlayer();
  // final bool playing = assetsAudioPlayer.isPlaying.value;

  @override
  void onInit() {
    super.onInit();
    // player.play();
    // _init();

    assetsAudioPlayer.open(
      Audio('assets/music/arirang_shel.wav'),
      loopMode: LoopMode.single,
      autoStart: true,
    );

    // playOrPause();
  }

  // Future<void> _init() async {
  //   final session = await AudioSession.instance;
  //   await session.configure(AudioSessionConfiguration.speech());
  //   await player.setLoopMode(LoopMode.one);

  //   await player.setAsset(backMusic);
  // }

  void playOrPause() {
    assetsAudioPlayer.playOrPause();
    musicState = assetsAudioPlayer.isPlaying.value;
    print('isplaying : $musicState');

    update();
  }

  void ChangeMuteButtonState() {
    // true : 재생, false : 일시정지/정지
    muteButtonState = !muteButtonState;
    // musicState = assetsAudioPlayer.isPlaying.value;

    print('button state : $muteButtonState');
    update();
  }

  @override
  void dispose() {
    // player.dispose();
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  void disposeAudioPlayer() {
    assetsAudioPlayer.stop();
    // assetsAudioPlayer.dispose();
  }

  void SvgStateChange() {
    svgState = !svgState;
    update();
  }

  // void MusicStateChange() {
  //   musicState = !musicState;
  //   update();
  // }
}
