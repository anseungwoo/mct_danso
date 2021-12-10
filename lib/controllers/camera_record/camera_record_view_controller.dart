import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class CameraRecordViewController extends GetxController {
  VideoPlayerController? videoPlayerController;
  Future<void>? videoPlayerFuture;
  var isFile;
  var isPlaying = false.obs;
  // final path;

  // CameraRecordViewController({required this.path});

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> asyncMethod({var path}) async {
    var dir = (await getApplicationDocumentsDirectory()).path;
    if (Platform.isAndroid) {
      if (File(path).existsSync()) {
        videoPlayerController = VideoPlayerController.file(File('${path}'));

        await videoPlayerController!.initialize();
        // await videoPlayerController!.setLooping(true);
      } else {
        isFile = false;
      }
    } else if (Platform.isIOS) {
      if (File('$dir/camera/videos/${path}').existsSync()) {
        print('ios video filename : ${path}');
        print('$dir/camera/videos/${path}');
        videoPlayerController =
            VideoPlayerController.file(File('$dir/camera/videos/${path}'));

        await videoPlayerController!.initialize();
        // await videoPlayerController!.setLooping(true);
      } else {
        isFile = false;
      }
    }
  }

  // void playVideo() {
  //   videoPlayerController!.play();
  //   isPlaying.value = true;
  //   update();
  // }

  // void pauseVideo() {
  //   videoPlayerController!.pause();
  //   isPlaying.value = false;
  //   update();
  // }
}
