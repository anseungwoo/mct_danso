import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/controllers/my_page_controller.dart';

Widget myPageListenDialog() {
  AudioPlayer player = AudioPlayer();
  final _recording =
      '/storage/emulated/0/Android/data/com.example.project_danso/files/flutter_audio_recorder_1635144151751.wav';
  void _play() {
    player.play(_recording, isLocal: true);
  }

  void _stop() {
    player.stop();
  }

  return Dialog(
    child: GetBuilder<MyPageController>(
        init: MyPageController(),
        builder: (controller) {
          return Container(
            height: 80.h,
            width: 330.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "**곡 듣기",
                  style: TextStyle(fontSize: 30),
                ),
                IconButton(
                    icon: controller.startIcon,
                    onPressed: () {
                      controller.changeStartStopState();
                      controller.starStopState ? _play() : _stop();
                    }),
              ],
            ),
          );
        }),
  );
}
