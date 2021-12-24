import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:just_audio/just_audio.dart' as ja;

class JangdanAndDansoSoundController extends GetxController {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  int speedCount = 2;

  ja.AudioPlayer jaPlayer = ja.AudioPlayer(
    handleInterruptions: false,
    androidApplyAudioAttributes: false,
    handleAudioSessionActivation: false,
  );
  List speed = [
    getSpeed(SongSpeed.eight),
    getSpeed(SongSpeed.nine),
    getSpeed(SongSpeed.ten),
    getSpeed(SongSpeed.eleven),
    getSpeed(SongSpeed.twelve)
  ];
  Future<void> setJangdanAndDansoSound(var songName) async {
    await jaPlayer.setAsset(getSongFilePath(songName));
  }

  void playJangdanAndDansoSound() {
    jaPlayer.play();
  }

  void stopJangdanAndDansoSound() {
    jaPlayer.stop();
  }

  void setJangdanAndDansoSoundSpeed(speed) {
    jaPlayer.setSpeed(speed);
  }

  Future<void> setJandan(var jangdan) async {
    await jaPlayer.setAsset(getJandan(jangdan));
  }

  String getJandan(var jangdan) {
    // String res = '';

    switch (jangdan) {
      case '중중모리장단':
        return getAudioFilePath(AudioFile.JoongJoong);
      case '굿거리장단':
        return getAudioFilePath(AudioFile.Good);
      case '세마치장단':
        return getAudioFilePath(AudioFile.Semachi);
      case '4박장단':
        return getAudioFilePath(AudioFile.Huimori);
      case '자진모리장단':
        return getAudioFilePath(AudioFile.Jagin);
      default: //high:
        return '';
    }
  }

  void setSpeed(speed) {
    jaPlayer.setSpeed(speed);
  }

  void jandanPlay() async {
    await jaPlayer.play();
  }

  void jandanStop() async {
    await jaPlayer.stop();
  }
}
