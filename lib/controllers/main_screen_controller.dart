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
  bool svgState = false;
  bool musicState = true;

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
    musicState = getBgmState.getBool('music_state') ?? true;

    playOrPause();
    update();
  }

  void playOrPause() async {
    final getBgmState = await SharedPreferences.getInstance();
    await player.setAsset('assets/music/arirang_shel.wav');
    if (musicState) {
      await getBgmState.setBool('music_state', musicState);
      // await assetsAudioPlayer.play();
      await player.play();
    } else if (!musicState) {
      await getBgmState.setBool('music_state', musicState);
      // await assetsAudioPlayer.stop();
      await player.stop();
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
    // assetsAudioPlayer.dispose();
    player.dispose();
    super.dispose();
  }

  void SvgStateChange() {
    svgState = !svgState;
    update();
  }
}
