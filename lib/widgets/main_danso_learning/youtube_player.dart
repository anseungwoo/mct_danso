import 'package:flutter/material.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/const.dart';

class YoutubePlayers extends StatefulWidget {
  final String url;

  const YoutubePlayers({Key? key, required this.url}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<YoutubePlayers>
    implements YouTubePlayerListener {
  var currentVideoSecond = 0.0;
  var playerState = '';
  late FlutterYoutubeViewController controller;

  @override
  void onCurrentSecond(double second) {
    print('onCurrentSecond second = $second');
    currentVideoSecond = second;
  }

  @override
  void onError(String error) {
    print('onError error = $error');
  }

  @override
  void onReady() {
    print('onReady');
  }

  @override
  void onStateChange(String state) {
    print('onStateChange state = $state');
    setState(() {
      playerState = state;
    });
  }

  @override
  void onVideoDuration(double duration) {
    print('onVideoDuration duration = $duration');
  }

  void _onYoutubeCreated(FlutterYoutubeViewController viewController) {
    controller = viewController;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: youtubeHeight.h,
      width: youtubeWidth.w,
      child: Center(
        child: FlutterYoutubeView(
          onViewCreated: _onYoutubeCreated,
          listener: this,
          params: YoutubeParam(
            videoId: widget.url,
            showUI: true,
            showYoutube: false,
            showFullScreen: false,
            autoPlay: false,
          ),
        ),
      ),
    );
  }
}
