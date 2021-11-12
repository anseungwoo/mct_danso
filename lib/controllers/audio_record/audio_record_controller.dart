import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/widgets.dart';

class AudioRecordController extends GetxController {
  final _playAndTestController = Get.put(PlayAndTestController());

  late FlutterAudioRecorder2 recorder;
  late Recording _recording;
  late Timer time;
  Widget buttonText = Text('녹음시작');
  late String alert;
  late String delPath;
  late String day;
  bool isRecording = false;

  @override
  void onInit() {
    super.onInit();
    Future.microtask(() {
      _prepare();
    });
  }

  @override
  void dispose() {
    super.dispose();

    print('call dispose method');
  }

  void isRecordingState() {
    isRecording = !isRecording;
    buttonText = isRecording ? Text('녹음중지') : Text('녹음시작');
    update();
  }

  Future _init() async {
    var customPath = '/flutter_audio_recorder_';
    Directory appDocDirectory;
    if (Platform.isIOS) {
      appDocDirectory = await getApplicationDocumentsDirectory();
    } else {
      appDocDirectory = (await getExternalStorageDirectory())!;
    }

    // can add extension like '.mp4' '.wav' '.m4a' '.aac'
    delPath = appDocDirectory.path + customPath;
    customPath = appDocDirectory.path +
        customPath +
        DateTime.now().millisecondsSinceEpoch.toString();
    day = DateTime.now().millisecondsSinceEpoch.toString();

    // .wav <---> AudioFormat.WAV
    // .mp4 .m4a .aac <---> AudioFormat.AAC
    // AudioFormat is optional, if given value, will overwrite path extension when there is conflicts.

    recorder = FlutterAudioRecorder2(customPath,
        audioFormat: AudioFormat.WAV, sampleRate: 22050);
    print(customPath);

    await recorder.initialized;
    update();
  }

  Future _prepare() async {
    var hasPermission = await FlutterAudioRecorder2.hasPermissions;
    if (hasPermission!) {
      await _init();
      var result = await recorder.current();
      _recording = result!;

      alert = '';
      update();
    } else {
      alert = 'Permission Required.';
      update();
    }
  }

  Future startRecording() async {
    await recorder.start();
    showToast(message: '녹음을 시작합니다.');
    var current = await recorder.current();
    _recording = current!;

    time = Timer.periodic(Duration(milliseconds: 3), (Timer t) async {
      var current = await recorder.current();
      _recording = current!;
      time = t;
      update();
    });
    update();
  }

  Future stopRecording() async {
    var result = await recorder.stop();
    showToast(message: '녹음이 완료되었습니다.');
    time.cancel();
    print(_recording.path);
    _recording = result!;
    _playAndTestController.stateCountUp(2);
    update();
  }
}
