import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/controllers/my_page_music_controller.dart';

Widget myPageListenDialog() {
  final _recording =
      '/storage/emulated/0/Android/data/com.mct.projectDanso1/files/flutter_audio_recorder_1635144151751.wav';

  return Dialog(
    child: GetBuilder<MyPageMusicController>(
        init: MyPageMusicController(),
        builder: (controller) {
          return Container(
            height: 80.h,
            width: 330.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: controller.startIcon,
                    onPressed: () {
                      controller.changeStartStopState();
                      controller.starStopState
                          ? controller.playMusic()
                          : controller.assetsAudioPlayer.pause();
                    }),
              ],
            ),
          );
        }),
  );
}
