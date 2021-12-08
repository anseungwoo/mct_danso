import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/audio_record/audio_record_controller.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/widgets.dart';

class SongAudioRecorder extends StatefulWidget {
  final JungganboController controller;
  final songId;

  SongAudioRecorder({Key? key, required this.controller, required this.songId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => SongAudioRecorderState();
}

class SongAudioRecorderState extends State<SongAudioRecorder> {
  AudioRecordController audioRecordController =
      Get.put(AudioRecordController());
  IndexManager indexManager = IndexManager();
  @override
  void dispose() {
    if (audioRecordController.isRecording == true) {
      audioRecordController.stopRecording(
          songId: widget.songId, exerType: 'audio');
      widget.controller.allMidiStop();
      indexManager.stopIndex();
    }

    if (audioRecordController.isRecording == false) {
      audioRecordController.getBack();
    }

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
              width: 81.w,
              height: 30.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: white,
                    onPrimary: buttonColorOrang,
                    side: BorderSide(color: buttonColorOrang),
                    textStyle:
                        TextStyle(fontSize: 12.sp, color: buttonColorOrang)),
                onPressed: () async {
                  audioRecordController.isRecordingState();
                  widget.controller.changeStartStopState();
                  if (widget.controller.startStopState) {
                    await Get.dialog(
                      Dialog(
                          backgroundColor: Colors.white.withOpacity(0),
                          elevation: 0,
                          child: GameTimerWidget()),
                      barrierDismissible: false,
                    );
                    audioRecordController.startRecording();
                    widget.controller.jandanPlay();
                    widget.controller.stepStart();
                    widget.controller.playJungGanBo(indexManager);
                    // widget.controller.audioSessionConfigure();
                  }
                  if (!widget.controller.startStopState) {
                    widget.controller.jandanStop();
                    audioRecordController.stopRecording(
                        songId: widget.songId, exerType: 'audio');
                    widget.controller.stepStop();

                    indexManager.stopIndex();
                  }
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
                child:
                    Text('반주만', style: TextStyle(fontSize: textSmallSize.sp)),
              ),
            ),
          ],
        );
      },
    );
  }
}
