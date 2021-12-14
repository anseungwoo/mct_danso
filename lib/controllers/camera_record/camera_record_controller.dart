import 'dart:io';

import 'package:camera/camera.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_danso/controllers/audio_and_video_db_controller.dart';
import 'package:project_danso/controllers/play_and_test_controller.dart';
import 'package:project_danso/main.dart';
import 'package:project_danso/widgets/widgets.dart';

class CameraRecordController extends GetxController {
  late CameraController controller;
  final int cameraIndex = 1;
  late Future<void> initializeControllerFuture;
  bool isRecording = false;
  String recordingText = '녹화시작';
  final _playAndTestController = Get.put(PlayAndTestController());
  final audioAndVideoDBController = Get.put(AudioAndVideoDBController());

  @override
  void onInit() {
    super.onInit();
    print('call onInit method');
    controller =
        CameraController(cameras![cameraIndex], ResolutionPreset.medium);
    initializeControllerFuture = controller.initialize();
  }

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
    print('call onClose method');
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    print('call dispose method');
  }

  void isRecordingState() {
    isRecording = !isRecording;
    recordingText = isRecording ? '녹화중지' : '녹화시작';
    update();
  }

  Future<void> onStop({var songId}) async {
    final video = await controller.stopVideoRecording();
    print(video.path);
    XFile androidVideoPath;
    if (Platform.isAndroid) {
      await GallerySaver.saveVideo(video.path);
      String videoPath = basename(video.path);
      String dir = '/storage/emulated/0/Movies/';
      String dirVideo = dir + videoPath;
      androidVideoPath = XFile('$dirVideo');
      _playAndTestController.stateCountTwo();
      audioAndVideoDBController.putAudioAndVideoRecordDB(
          exerPath: androidVideoPath.path, exerType: 'video', songId: songId);
    } else if (Platform.isIOS) {
      _playAndTestController.stateCountTwo();
      audioAndVideoDBController.putAudioAndVideoRecordDB(
          exerPath: video.path, exerType: 'video', songId: songId);
    }

    // print(video);
    // print(video.path);
    // if (Platform.isAndroid) {
    //   await GallerySaver.saveVideo(video.path, albumName: '단소');
    // }

    showToast(message: '녹화가 완료되었습니다.');

    // // if (Platform.isAndroid) {
    // //   File(video.path).deleteSync(); // 이코드 주석 처리하니깐 ios에서 실행됨
    // // }
    // ;
    // _playAndTestController.stateCountTwo();
    // audioAndVideoDBController.putAudioAndVideoRecordDB(
    //     exerPath: video.path, exerType: 'video', songId: songId);
    // update();
  }

  void getBack() {
    _playAndTestController.stateCountTwo();
    update();
  }

  Future<void> onRecord() async {
    await controller.startVideoRecording();

    showToast(message: '녹화를 시작합니다.');

    update();
  }
}
