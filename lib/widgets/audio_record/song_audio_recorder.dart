import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/widgets.dart';

class SongAudioRecorder extends StatefulWidget {
  final JungganboController controller;
  final songId;
  final String jangdan;
  SongAudioRecorder(
      {Key? key,
      required this.controller,
      required this.jangdan,
      required this.songId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => SongAudioRecorderState();
}

class SongAudioRecorderState extends State<SongAudioRecorder> {
  AudioRecordController audioRecordController =
      Get.put(AudioRecordController());
  @override
  void dispose() {
    if (audioRecordController.isRecording == true) {
      audioRecordController.stopRecording(
          songId: widget.songId, exerType: 'audio');
      widget.controller.jandanStop();
    }

    if (audioRecordController.isRecording == false) {
      audioRecordController.getBack();
    }

    super.dispose();
  }

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
                    primary: MctColor.white.getMctColor,
                    onPrimary: MctColor.buttonColorOrange.getMctColor,
                    side: BorderSide(
                        color: MctColor.buttonColorOrange.getMctColor),
                    textStyle: TextStyle(
                        fontSize: 12.sp,
                        color: MctColor.buttonColorOrange.getMctColor)),
                onPressed: () async {
                  audioRecordController.isRecordingState();
                  widget.controller.changeStartStopState();
                  widget.controller.setJandan(widget.jangdan);

                  if (widget.controller.startStopState) {
                    await Get.dialog(
                      Dialog(
                          backgroundColor:
                              MctColor.white.getMctColor.withOpacity(0),
                          elevation: 0,
                          child: GameTimerWidget(
                            timer: widget.controller.micro,
                          )),
                      barrierDismissible: false,
                    );
                    widget.controller.isLevelPracticeState();
                    audioRecordController.startRecording();
                    widget.controller.jandanPlay();
                    widget.controller.stepStart();
                  }
                  if (!widget.controller.startStopState) {
                    widget.controller.jandanStop();
                    audioRecordController.stopRecording(
                        songId: widget.songId, exerType: 'audio');
                    widget.controller.stepStop();
                    widget.controller.isLevelPracticeState();
                  }
                },
                child: audioRecordController.buttonText,
              ),
            ),
          ],
        );
      },
    );
  }
}
