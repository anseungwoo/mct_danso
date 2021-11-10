import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_danso/controllers/controllers.dart';

class AudioRecordController extends GetxController {
  final _playAndTestController = Get.put(PlayAndTestController());

  late FlutterAudioRecorder2 recorder;
  late Recording _recording;
  late Timer time;
  Widget buttonText = Text('녹음오류');
  late String alert;
  late String delPath;
  late String day;

  @override
  void onInit() {
    super.onInit();
    Future.microtask(() {
      _prepare();
    });
  }

  Widget _buttonTextState(RecordingStatus status) {
    switch (status) {
      case RecordingStatus.Initialized:
        {
          return Text('녹음시작');
        }
      case RecordingStatus.Recording:
        {
          return Text('녹음멈춤');
        }
      case RecordingStatus.Stopped:
        {
          return Text('녹음정지');
        }
      default:
        return Icon(Icons.do_not_disturb_on);
    }
  }

  void changeState() async {
    switch (_recording.status) {
      case RecordingStatus.Initialized:
        {
          await _startRecording();
          break;
        }
      case RecordingStatus.Recording:
        {
          await _stopRecording();
          break;
        }
      case RecordingStatus.Stopped:
        {
          await _prepare();
          break;
        }

      default:
        break;
    }

    buttonText = _buttonTextState(_recording.status!);
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
      buttonText = _buttonTextState(_recording.status!);
      alert = '';
      update();
    } else {
      alert = 'Permission Required.';
      update();
    }
  }

  Future _startRecording() async {
    await recorder.start();
    var current = await recorder.current();
    _recording = current!;

    time = Timer.periodic(Duration(milliseconds: 10), (Timer t) async {
      var current = await recorder.current();
      _recording = current!;
      time = t;
      update();
    });
    update();
  }

  Future _stopRecording() async {
    var result = await recorder.stop();
    time.cancel();
    print(_recording.path);
    _recording = result!;
    _playAndTestController.stateCountUp(2);
    update();
  }
}
