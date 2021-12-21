// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:get/get.dart';
// import 'package:project_danso/common/common.dart';
// import 'package:just_audio/just_audio.dart' as ja;

// class MyPageController extends GetxController {
//   bool starStopState = false;
//   double currentSliderValue = 20;
//   // AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

//   ja.AudioPlayer player = ja.AudioPlayer(
//     // handleInterruptions: false,
//     // androidApplyAudioAttributes: false,
//     handleAudioSessionActivation: false,
//   );

//   @override
//   void onInit() async {
//     super.onInit();
//   }

//   void playMusic() async {
//     // await assetsAudioPlayer.open(
//     //   Audio(getAudioFilePath(AudioFile.BackGroundMusic)),
//     // );
//     // await assetsAudioPlayer.play();
//     await player.setAsset(getAudioFilePath(AudioFile.BackGroundMusic));
//     await player.play();
//   }

//   @override
//   void dispose() {
//     // assetsAudioPlayer.stop();
//     player.stop();
//     super.dispose();
//   }

//   void currenrSliderValueChange(double value) {
//     currentSliderValue = value;
//     update();
//   }
// }
