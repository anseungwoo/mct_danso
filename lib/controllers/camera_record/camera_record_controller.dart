import 'dart:io';
import 'package:camera/camera.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:project_danso/controllers/controllers.dart';
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

  void isRecordingState() {
    isRecording = !isRecording;
    recordingText = isRecording ? '녹화중지' : '녹화시작';
    update();
  }

  Future onStop({var songId}) async {
    final video = await controller.stopVideoRecording();
    print(video.path);
    XFile androidVideoPath;
    if (Platform.isAndroid) {
      await GallerySaver.saveVideo(video.path);
      var videoPath = basename(video.path);
      var dir = '/storage/emulated/0/Movies/';
      var dirVideo = dir + videoPath;
      androidVideoPath = XFile('$dirVideo');
      _playAndTestController.stateCountTwo();
      audioAndVideoDBController.putAudioAndVideoRecordDB(
          exerPath: androidVideoPath.path, exerType: 'video', songId: songId);
    } else if (Platform.isIOS) {
      _playAndTestController.stateCountTwo();
      audioAndVideoDBController.putAudioAndVideoRecordDB(
          exerPath: video.path, exerType: 'video', songId: songId);
    }
    showToast(message: '녹화가 완료되었습니다.');
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
