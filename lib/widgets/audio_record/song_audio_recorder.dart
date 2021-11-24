import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/audio_record/audio_record_controller.dart';
import 'package:project_danso/controllers/controllers.dart';

class SongAudioRecorder extends StatefulWidget {
  final JungganboController controller;

  SongAudioRecorder({Key? key, required this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SongAudioRecorderState();
}

class SongAudioRecorderState extends State<SongAudioRecorder> {
  final audioRecordController = Get.put(AudioRecordController());
  @override
  void dispose() {
    audioRecordController.isRecording
        ? audioRecordController.stopRecording()
        : audioRecordController.getBack();
    super.dispose();
  }
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
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioRecordController>(
      init: audioRecordController,
      builder: (audioController) {
        return Row(
          children: <Widget>[
            Container(
              width: 78.w,
              height: 30.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: white,
                    onPrimary: buttonColorOrang,
                    side: BorderSide(color: buttonColorOrang),
                    textStyle:
                        TextStyle(fontSize: 12.sp, color: buttonColorOrang)),
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
            ),
            SizedBox(width: 5.w),
            Container(
              width: 78.w,
              height: 30.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: white,
                    onPrimary: buttonColorOrang,
                    side: BorderSide(color: buttonColorOrang),
                    textStyle:
                        TextStyle(fontSize: 12.sp, color: buttonColorOrang)),
                onPressed: () {},
                child: Text('반주만'),
              ),
            ),
          ],
        );
      },
    );
  }
}
