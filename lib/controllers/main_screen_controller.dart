import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:just_audio/just_audio.dart' as ja;

class MainScreenController extends GetxController with WidgetsBindingObserver {
  ja.AudioPlayer player = ja.AudioPlayer(
    handleInterruptions: false,
    handleAudioSessionActivation: false,
  );
  var svgState = false.obs;
  var musicState = true.obs;

  @override
  void onInit() {
    super.onInit();
    getMusicState();
  }

  @override
  void onClose() {
    super.onClose();
    player.dispose();
  }

  void getMusicState() async {
    final getBgmState = await SharedPreferences.getInstance();
    musicState.value = getBgmState.getBool('music_state') ?? true;
    playOrPause();
  }

  void playOrPause() async {
    final getBgmState = await SharedPreferences.getInstance();
    await player.setAsset('assets/music/arirang_shel.wav');
    if (musicState.value) {
      await getBgmState.setBool('music_state', musicState.value);
      await player.play();
    } else if (!musicState.value) {
      await getBgmState.setBool('music_state', musicState.value);
      await player.stop();
    }
  }

  void ChangeMuteButtonState() {
    musicState.value = !musicState.value;
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void SvgStateChange() {
    svgState.value = !svgState.value;
  }
}
