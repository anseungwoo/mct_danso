import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreenController extends GetxController with WidgetsBindingObserver {
  final assetsAudioPlayer = AssetsAudioPlayer();
  bool svgState = false;
  late bool musicState;

  @override
  void onInit() {
    super.onInit();
    getMusicState();
  }

  void getMusicState() async {
    final getBgmState = await SharedPreferences.getInstance();
    musicState = getBgmState.getBool('music_state') ?? true;
    playOrPause();
    update();
  }

  void playOrPause() async {
    final getBgmState = await SharedPreferences.getInstance();
    if (musicState) {
      await assetsAudioPlayer.open(
        Audio('assets/music/arirang_shel.wav'),
        loopMode: LoopMode.single,
      );
      await getBgmState.setBool('music_state', musicState);
      await assetsAudioPlayer.play();
    } else if (!musicState) {
      await getBgmState.setBool('music_state', musicState);
      await assetsAudioPlayer.stop();
    }
    print('isplaying : $musicState');
    update();
  }

  void ChangeMuteButtonState() {
    musicState = !musicState;
    update();
  }

  @override
  void dispose() {
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  void SvgStateChange() {
    svgState = !svgState;
    update();
  }
}
