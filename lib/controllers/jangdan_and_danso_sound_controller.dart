import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';

class JangdanAndDansoSoundController extends GetxController {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  int speedCount = 2;

  List speed = [
    getSpeed(SongSpeed.eight),
    getSpeed(SongSpeed.nine),
    getSpeed(SongSpeed.ten),
    getSpeed(SongSpeed.eleven),
    getSpeed(SongSpeed.twelve)
  ];

  void setJandan(var jangdan) async {
    await assetsAudioPlayer.open(
      Audio(getJandan(jangdan)),
      autoStart: false,
      loopMode: LoopMode.single,
    );
    setSpeed(speed[speedCount]);
    // await player.setAsset('assets/music/123123.mp3');
    // await player.setLoopMode(ja.LoopMode.one);
  }

  void setJangdanAndDansoSound(var songName) async {
    await assetsAudioPlayer.open(
      Audio(getSongFilePath(songName)),
      autoStart: false,
      loopMode: LoopMode.single,
    );
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
    assetsAudioPlayer.setPlaySpeed(speed);
    update();
  }

  void jandanPlay() async {
    await assetsAudioPlayer.setVolume(1);
    await assetsAudioPlayer.play();
  }

  void jandanStop() async {
    await assetsAudioPlayer.stop();
  }
}
