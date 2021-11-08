import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:project_danso/controllers/audio_record/audio_record_controller.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_danso/controllers/controllers.dart';

class SongAudioRecorder extends StatefulWidget {
  final PlayAndTestController controller;
  SongAudioRecorder({Key key, this.controller}) : super(key: key);
  @override
  State<StatefulWidget> createState() => SongAudioRecorderState();
}

class SongAudioRecorderState extends State<SongAudioRecorder> {
  final audioRecordController = Get.put(AudioRecordController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioRecordController>(
      init: audioRecordController,
      builder: (audioController) {
        return Row(
          children: <Widget>[
            ElevatedButton(
              onPressed: audioRecordController.changeState,
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
