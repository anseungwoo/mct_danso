import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/utils/danso_function.dart';
import 'package:project_danso/controllers/jangdan_and_danso_sound_controller.dart';
import 'package:project_danso/widgets/widgets.dart';

class SongAudioRecorder extends StatefulWidget {
  final JungGanBo jungGanBo;
  final songId;
  final String jangdan;
  SongAudioRecorder(
      {Key? key,
      required this.jungGanBo,
      required this.jangdan,
      required this.songId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => SongAudioRecorderState();
}

class SongAudioRecorderState extends State<SongAudioRecorder> {
  AudioRecordController audioRecordController =
      Get.put(AudioRecordController());
//   JungganboController jungganboController = Get.put(JungganboController());
  JangdanAndDansoSoundController jangdanAndDansoSoundController =
      Get.put(JangdanAndDansoSoundController());
  @override
  void dispose() {
    if (audioRecordController.isRecording == true) {
      audioRecordController.stopRecording(
          songId: widget.songId, exerType: 'audio');
//       jungganboController.jandanStop();
      jangdanAndDansoSoundController.jandanStop();
    }

    if (audioRecordController.isRecording == false) {
      audioRecordController.getBack();
    }

    super.dispose();
  }

  @override
  void initState() {
    jungganboController.setJandan(widget.jangdan);
    super.initState();
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
//                   jungganboController.changeStartStopState();
                  widget.controller.changeStartStopState();
                  jangdanAndDansoSoundController.setJandan(widget.jangdan);

                  if (jungganboController.startStopState) {
                    jungganboController.jandanPlay();
                    jungganboController.isLevelPracticeState();
                    await Get.dialog(
                      Dialog(
                          backgroundColor:
                              MctColor.white.getMctColor.withOpacity(0),
                          elevation: 0,
                          child: GameTimerWidget(
                            timer: widget.jungGanBo.jangDan.delay ~/
                                jungganboController
                                    .speed[jungganboController.speedCount],
                          )),
                      barrierDismissible: false,
                    );

                    audioRecordController.startRecording();
//                     jungganboController.stepStart();
//                   }
//                   if (!jungganboController.startStopState) {
//                     jungganboController.isLevelPracticeState();
//                     jungganboController.jandanStop();
                    jangdanAndDansoSoundController.jandanPlay();
                    widget.controller.stepStart();
                  }
                  if (!widget.controller.startStopState) {
                    jangdanAndDansoSoundController.jandanStop();
                    audioRecordController.stopRecording(
                        songId: widget.songId, exerType: 'audio');
                    jungganboController.stepStop();
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
