import 'dart:io';

import 'package:camera/camera.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:project_danso/controllers/play_and_test_controller.dart';
import 'package:project_danso/main.dart';
import 'package:project_danso/widgets/widgets.dart';

class CameraRecordController extends GetxController {
  late CameraController controller;
  final int cameraIndex = 1;
  late Future<void> initializeControllerFuture;
  bool isRecording = false;
  String recordingText = "녹화시작";

  final _playAndTestController = Get.put(PlayAndTestController());
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
    recordingText = isRecording ? "녹화중지" : "녹화시작";
    update();
  }

  Future<void> onStop() async {
    final video = await controller.stopVideoRecording();
    print(video);
    print(video.path);
    if (Platform.isIOS) {
      await GallerySaver.saveVideo(
        '${video.path}',
      );
      showToast(message: '녹화가 완료되었습니다.');
    } else {
      await GallerySaver.saveVideo(
        video.path,
      );
      showToast(message: '녹화가 완료되었습니다.');
    }
    // File(video.path).deleteSync(); // 이코드 주석 처리하니깐 ios에서 실행됨

    _playAndTestController.stateCountUp(2);
    update();
  }

  Future<void> onRecord() async {
    await controller.startVideoRecording();
    showToast(message: '녹화를 시작합니다.');

    update();
  }
}
