import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class CameraRecordViewController extends GetxController {
  VideoPlayerController? videoPlayerController;
  Future<void>? videoPlayerFuture;
  var isFile;
  final path;

  CameraRecordViewController({required this.path});

  @override
  void onInit() async {
    super.onInit();

    var dir = (await getApplicationDocumentsDirectory()).path;
    if (Platform.isAndroid) {
      if (File(path).existsSync()) {
        videoPlayerController = VideoPlayerController.file(File('${path}'));

        videoPlayerFuture = videoPlayerController!.initialize();
        videoPlayerController!.setLooping(true);
      } else {
        isFile = false;
      }
    } else if (Platform.isIOS) {
      if (File(path).existsSync()) {
        print('ios video filename : ${path}');
        videoPlayerController =
            VideoPlayerController.file(File('$dir/camera/videos/${path}'));

        videoPlayerFuture = videoPlayerController!.initialize();
        videoPlayerController!.setLooping(true);
      } else {
        isFile = false;
      }
    }
  }

  // void asyncMethod({required path}) async {}
}
