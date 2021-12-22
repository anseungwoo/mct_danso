import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:just_audio/just_audio.dart' as ja;

class MainScreenController extends GetxController with WidgetsBindingObserver {
  // final assetsAudioPlayer = AssetsAudioPlayer();

  ja.AudioPlayer player = ja.AudioPlayer(
    handleInterruptions: false,
    // androidApplyAudioAttributes: false,
    handleAudioSessionActivation: false,
  );
  var svgState = false.obs;
  var musicState = true.obs;

  @override
  void onInit() {
    super.onInit();
    // assetsAudioPlayer.open(
    //   Audio('assets/music/arirang_shel.wav'),
    //   loopMode: LoopMode.single,
    // );
    // await player.setAsset('assets/music/arirang_shel.wav');

    getMusicState();
  }

  @override
  void onClose() {
    super.onClose();
    // assetsAudioPlayer.dispose();
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
      // await assetsAudioPlayer.play();
      await player.play();
    } else if (!musicState.value) {
      await getBgmState.setBool('music_state', musicState.value);
      // await assetsAudioPlayer.stop();
      await player.stop();
    }
  }

  void ChangeMuteButtonState() {
    musicState.value = !musicState.value;
  }

  @override
  void dispose() {
    // assetsAudioPlayer.dispose();
    player.dispose();
    super.dispose();
  }

  void SvgStateChange() {
    svgState.value = !svgState.value;
    // update();
  }
}
