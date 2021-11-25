import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/controllers/my_page_music_controller.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

extension FormatString on Duration {
  String get mmSSFormat {
    String twoDigits(int n) {
      if (n >= 10) return '$n';
      return '0$n';
    }

    final twoDigitMinutes =
        twoDigits(inMinutes.remainder(Duration.minutesPerHour));
    final twoDigitSeconds =
        twoDigits(inSeconds.remainder(Duration.secondsPerMinute));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}

// Widget myPageListenDialog() {
//   final _recording =
//       '/storage/emulated/0/Android/data/com.mct.projectDanso1/files/flutter_audio_recorder_1635144151751.wav';
//   MyPageMusicController myPageController = Get.put(MyPageMusicController());
//   Duration visibleValue;
//   return Dialog(
//     child: Container(
//       width: 330.w,
//       height: 200.h,
//       child: GetBuilder<MyPageMusicController>(
//           init: myPageController,
//           builder: (controller) {
//             return AudioWidget.assets(
//               path: backMusic,
//               play: controller.starStopState,
//               onReadyToPlay: (total) {
//                 controller.currentPositionState(
//                     '${Duration().mmSSFormat} / ${total.mmSSFormat}');
//               },
//               onPositionChanged: (current, total) {
//                 controller.currentPositionState(
//                     '${current.mmSSFormat} / ${total.mmSSFormat}');
//               },
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.max,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           shape: CircleBorder(),
//                           padding: EdgeInsets.all(14),
//                           primary: Colors.red,
//                         ),
//                         onPressed: () {
//                           controller.changeStartStopState();
//                         },
//                         child: controller.startIcon),
//                   ),
//                   Text(controller.currentPosition),
//                   Expanded(
//                     child: NeumorphicSlider(
//                       min: 0,
//                       max: 100,
//                       value: 0,
//                       style: SliderStyle(
//                           variant: Colors.grey, accent: Colors.grey[500]),
//                       onChangeEnd: (newValue) {},
//                       onChangeStart: (_) {},
//                       onChanged: (newValue) {},
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }),
//     ),
//   );
// }
Widget myPageListenDialog(BuildContext context) {
  final _recording =
      '/storage/emulated/0/Android/data/com.mct.projectDanso1/files/flutter_audio_recorder_1635144151751.wav';

  return Dialog(
    child: Container(
      width: 330.w,
      height: 200.h,
      child: GetBuilder<MyPageMusicController>(
          init: myPageController,
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                controller.assetsAudioPlayer.builderCurrent(
                    builder: (context, Playing? playing) {
                  if (playing == null) {
                    return Text('data');
                  }
                  return Column(
                    children: <Widget>[
                      controller.assetsAudioPlayer.builderLoopMode(
                        builder: (context, loopMode) {
                          return PlayerBuilder.isPlaying(
                              player: controller.assetsAudioPlayer,
                              builder: (context, isPlaying) {
                                return PlayingControls(
                                  loopMode: LoopMode.single,
                                  isPlaying: isPlaying,
                                  isPlaylist: false,
                                  toggleLoop: () {
                                    controller.assetsAudioPlayer.toggleLoop();
                                  },
                                  onPlay: () {
                                    controller.assetsAudioPlayer.playOrPause();
                                  },
                                  onNext: () {
                                    //controller.assetsAudioPlayer.forward(Duration(seconds: 10));
                                    controller.assetsAudioPlayer.next();
                                  },
                                  onPrevious: () {
                                    controller.assetsAudioPlayer.previous();
                                  },
                                );
                              });
                        },
                      ),
                      controller.assetsAudioPlayer.builderRealtimePlayingInfos(
                          builder: (context, RealtimePlayingInfos? infos) {
                        if (infos == null) {
                          return Text('data');
                        }
                        return Column(
                          children: [
                            PositionSeekWidget(
                              currentPosition: infos.currentPosition,
                              duration: infos.duration,
                              seekTo: (to) {
                                controller.assetsAudioPlayer.seek(to);
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                NeumorphicButton(
                                  onPressed: () {
                                    controller.assetsAudioPlayer
                                        .seekBy(Duration(seconds: -10));
                                  },
                                  child: Text('-10'),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                NeumorphicButton(
                                  onPressed: () {
                                    controller.assetsAudioPlayer
                                        .seekBy(Duration(seconds: 10));
                                  },
                                  child: Text('+10'),
                                ),
                              ],
                            )
                          ],
                        );
                      }),
                    ],
                  );
                }),
              ],
            );
          }),
    ),
  );
}
