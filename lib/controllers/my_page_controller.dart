import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/audio_file_path.dart';

import 'package:project_danso/common/contant.dart';

class MyPageController extends GetxController {
  bool starStopState = false;
  double currentSliderValue = 20;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void onInit() async {
    super.onInit();
  }

  void playMusic() async {
    await assetsAudioPlayer.open(
      Audio(getAudioFilePath(AudioFile.BackGroundMusic)),
    );
    await assetsAudioPlayer.play();
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
}
