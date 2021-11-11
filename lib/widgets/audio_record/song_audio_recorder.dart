import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/controllers/audio_record/audio_record_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_danso/controllers/controllers.dart';

class SongAudioRecorder extends StatefulWidget {
  final JungganboController controller;

  SongAudioRecorder({Key? key, required this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SongAudioRecorderState();
}

class SongAudioRecorderState extends State<SongAudioRecorder> {
  final audioRecordController = Get.put(AudioRecordController());

  // late FlutterAudioRecorder2 _recorder;
  // late Recording _recording;
  // late Timer _time;
  // Widget _buttonText = Text('녹음오류');
  // late String alert;
  // late String delPath;
  // late String day;
//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() {
//       _prepare();
//     });
//   }

//   void _changeState() async {
//     switch (_recording.status) {
//       case RecordingStatus.Initialized:
//         {
//           await _startRecording();
//           break;
//         }
//       case RecordingStatus.Recording:
//         {
//           await _stopRecording();
//           break;
//         }
//       case RecordingStatus.Stopped:
//         {
//           await _prepare();
//           break;
//         }

//       default:
//         break;
//     }

//     setState(() {
//       _buttonText = _buttonTextState(_recording.status!);
//     });
//   }

//   Future _init() async {
//     var customPath = '/flutter_audio_recorder_';
//     Directory appDocDirectory;
//     if (Platform.isIOS) {
//       appDocDirectory = await getApplicationDocumentsDirectory();
//     } else {
//       appDocDirectory = (await getExternalStorageDirectory())!;
//     }

//     // can add extension like '.mp4' '.wav' '.m4a' '.aac'
//     delPath = appDocDirectory.path + customPath;
//     customPath = appDocDirectory.path +
//         customPath +
//         DateTime.now().millisecondsSinceEpoch.toString();
//     day = DateTime.now().millisecondsSinceEpoch.toString();

//     // .wav <---> AudioFormat.WAV
//     // .mp4 .m4a .aac <---> AudioFormat.AAC
//     // AudioFormat is optional, if given value, will overwrite path extension when there is conflicts.

//     _recorder = FlutterAudioRecorder2(customPath,
//         audioFormat: AudioFormat.WAV, sampleRate: 22050);

//     await _recorder.initialized;
//   }

//   Future _prepare() async {
//     var hasPermission = await FlutterAudioRecorder2.hasPermissions;
//     if (hasPermission!) {
//       await _init();
//       var result = await _recorder.current();
//       setState(() {
//         _recording = result!;
//         _buttonText = _buttonTextState(_recording.status!);
//         alert = '';
//       });
//     } else {
//       setState(() {
//         alert = 'Permission Required.';
//       });
//     }
//   }

//   Future _startRecording() async {
//     await _recorder.start();
//     var current = await _recorder.current();
//     setState(() {
//       _recording = current!;
//     });

//     _time = Timer.periodic(Duration(milliseconds: 10), (Timer t) async {
//       var current = await _recorder.current();
//       setState(() {
//         _recording = current!;
//         _time = t;
//       });
//     });
//   }

//   Future _stopRecording() async {
//     var result = await _recorder.stop();
//     _time.cancel();
//     print(_recording.path);
//     setState(() {
//       _recording = result!;
//     });
//     widget.controller.stateCountUp(2);
//   }
// //  삭제기능 테스트 함수입니다.
//   // Future _del() async {
//   //   // AudioPlayer player = AudioPlayer();
//   //   // player.play(_recording.path, isLocal: true);
//   //   try {
//   //     print(delPath);
//   //     print(_recording.path);
//   //     print(day);
//   //     final _localFile = io.File('${delPath}${day}.wav');
//   //     print(_localFile);
//   //     final file = await _localFile;

//   //     await file.delete();
//   //   } catch (e) {
//   //     return;
//   //   }
//   // }

//   Widget _buttonTextState(RecordingStatus status) {
//     switch (status) {
//       case RecordingStatus.Initialized:
//         {
//           return Text('녹음시작');
//         }
//       case RecordingStatus.Recording:
//         {
//           return Text('녹음멈춤');
//         }
//       case RecordingStatus.Stopped:
//         {
//           return Text('녹화정지');
//         }
//       default:
//         return Icon(Icons.do_not_disturb_on);
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioRecordController>(
      init: audioRecordController,
      builder: (audioController) {
        return Row(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                audioRecordController.isRecordingState();
                audioRecordController.isRecording
                    ? audioRecordController.startRecording()
                    : audioRecordController.stopRecording();
                widget.controller.changeStartStopState();
                widget.controller.starStopState
                    ? widget.controller.stepStart()
                    : widget.controller.stepStop();
              },
              child: audioRecordController.buttonText,
            ),
            SizedBox(width: 5.w),
            ElevatedButton(
              onPressed: () {},
              child: Text('반주만'),
            ),
          ],
        );
      },
    );
  }
}
