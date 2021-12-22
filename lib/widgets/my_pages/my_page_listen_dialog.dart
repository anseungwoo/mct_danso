import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
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

class MyPageListenDialog extends StatefulWidget {
  final recordItem;

  const MyPageListenDialog({Key? key, required this.recordItem})
      : super(key: key);

  @override
  State<MyPageListenDialog> createState() => _MyPageListenDialogState();
}

class _MyPageListenDialogState extends State<MyPageListenDialog> {
  var myPageMusicController = Get.put(MyPageMusicController());
  // var audioAndVideoListController = Get.put(AudioAndVideoListController());

  @override
  void initState() {
    super.initState();

    print('asdfasdf ${widget.recordItem}');
    myPageMusicController.playerInit(widget.recordItem);
  }

  @override
  void dispose() {
    super.dispose();
    myPageMusicController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          height: 70.h,
          child: myPageMusicController.isFile
              ? GetBuilder<MyPageMusicController>(
                  init: myPageMusicController,
                  builder: (controller) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          controller.assetsAudioPlayer.builderCurrent(
                              builder: (context, Playing? playing) {
                            return Row(
                              children: <Widget>[
                                controller.assetsAudioPlayer.builderLoopMode(
                                  builder: (context, loopMode) {
                                    return PlayerBuilder.isPlaying(
                                        player: controller.assetsAudioPlayer,
                                        builder: (context, isPlaying) {
                                          return NeumorphicButton(
                                            style: NeumorphicStyle(
                                              boxShape:
                                                  NeumorphicBoxShape.circle(),
                                            ),
                                            onPressed: () {
                                              controller.assetsAudioPlayer
                                                  .playOrPause();
                                            },
                                            child: isPlaying
                                                ? SvgPicture.asset(
                                                    PLAY_STOP_SVG)
                                                : SvgPicture.asset(
                                                    PLAY_SVG,
                                                    color: MctColor
                                                        .black.getMctColor,
                                                  ),
                                          );
                                        });
                                  },
                                ),
                                controller.assetsAudioPlayer
                                    .builderRealtimePlayingInfos(builder:
                                        (context, RealtimePlayingInfos? infos) {
                                  return PositionSeekWidget(
                                    currentPosition: infos!.currentPosition,
                                    duration: infos.duration,
                                    seekTo: (to) {
                                      controller.assetsAudioPlayer.seek(to);
                                    },
                                  );
                                }),
                              ],
                            );
                          }),
                        ],
                      ),
                    );
                  })
              : Center(
                  child: Text(
                  '저장 된 파일이 없거나 파일 이름이 바뀌었습니다.',
                  style: TextStyle(fontSize: 12.sp, fontFamily: NOTO_REGULAR),
                ))),
    );
  }
}
