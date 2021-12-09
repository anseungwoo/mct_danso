import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/db/db_helpers.dart';
import 'package:project_danso/models/models.dart';
import 'package:project_danso/screens/screens.dart';

class MyPageMusicController extends GetxController {
  // static MyPageMusicController get to => Get.find();
  String? audioRecordPath;
  bool starStopState = false;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool play = false;
  String currentPosition = '';
  Icon startIcon = Icon(
    Icons.play_arrow,
    size: 40,
  );
  bool isFile = true;
  @override
  void onInit() {
    super.onInit();
    // playerInit();
  }

  void playerInit(var audioRecordPath) async {
    print(audioRecordPath);
    File(audioRecordPath).existsSync()
        ? await assetsAudioPlayer.open(
            Audio.file(audioRecordPath),
            autoStart: false,
          )
        : isFile = false;

    await assetsAudioPlayer.setLoopMode(LoopMode.single);
  }

  void playAndPause() {
    assetsAudioPlayer.playOrPause();
  }

  @override
  void dispose() {
    assetsAudioPlayer.stop();
    assetsAudioPlayer.dispose();
    print('dispose');
    super.dispose();
  }

  void changeStartStopState() {
    starStopState = !starStopState;
    startIcon = starStopState
        ? Icon(
            Icons.pause,
            size: 40,
          )
        : Icon(
            Icons.play_arrow,
            size: 40,
          );
    update();
  }
}

class PositionSeekWidget extends StatefulWidget {
  final Duration currentPosition;
  final Duration duration;
  final Function(Duration) seekTo;

  const PositionSeekWidget({
    required this.currentPosition,
    required this.duration,
    required this.seekTo,
  });

  @override
  _PositionSeekWidgetState createState() => _PositionSeekWidgetState();
}

class _PositionSeekWidgetState extends State<PositionSeekWidget> {
  late Duration _visibleValue;
  bool listenOnlyUserInterraction = false;
  double get percent => widget.duration.inMilliseconds == 0
      ? 0
      : _visibleValue.inMilliseconds / widget.duration.inMilliseconds;

  @override
  void initState() {
    super.initState();
    _visibleValue = widget.currentPosition;
  }

  @override
  void didUpdateWidget(PositionSeekWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listenOnlyUserInterraction) {
      _visibleValue = widget.currentPosition;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          NeumorphicSlider(
            min: 0,
            max: widget.duration.inMilliseconds.toDouble(),
            value: percent * widget.duration.inMilliseconds.toDouble(),
            style: SliderStyle(variant: logoColor, accent: logoColor),
            onChangeEnd: (newValue) {
              setState(() {
                listenOnlyUserInterraction = false;
                widget.seekTo(_visibleValue);
              });
            },
            onChangeStart: (_) {
              setState(() {
                listenOnlyUserInterraction = true;
              });
            },
            onChanged: (newValue) {
              setState(() {
                final to = Duration(milliseconds: newValue.floor());
                _visibleValue = to;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 40,
                child: Text(durationToString(widget.currentPosition)),
              ),
              SizedBox(
                width: 40,
                child: Text(durationToString(widget.duration)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String durationToString(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  final twoDigitMinutes =
      twoDigits(duration.inMinutes.remainder(Duration.minutesPerHour));
  final twoDigitSeconds =
      twoDigits(duration.inSeconds.remainder(Duration.secondsPerMinute));
  return '$twoDigitMinutes:$twoDigitSeconds';
}
