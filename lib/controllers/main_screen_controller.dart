import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:project_danso/common/const.dart';
import 'package:rxdart/rxdart.dart';

class MainScreenController extends GetxController with WidgetsBindingObserver {
  bool svgState = false;
  bool musicState = false;
  AudioPlayer player = AudioPlayer();

  @override
  void onInit() {
    super.onInit();

    player.play();
    _init();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    await player.setLoopMode(LoopMode.one);

    await player.setAsset(backMusic);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void SvgStateChange() {
    svgState = !svgState;
    update();
  }

  void MusicStateChange() {
    musicState = !musicState;
    update();
  }
}
