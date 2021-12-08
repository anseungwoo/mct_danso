import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoApp extends StatefulWidget {
  final videoFilePath;
  VideoApp({Key? key, required this.videoFilePath}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController videoPlayerController;
  late Future<void> videoPlayerFuture;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.file(File('${widget.videoFilePath}'));
    videoPlayerFuture = videoPlayerController.initialize();
    videoPlayerController.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            tabbarAndAppBar(title: '내연주 보기', tabbar: null, enableTabBar: false),
        body: FutureBuilder(
          future: videoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: videoPlayerController.value.aspectRatio,
                child: VideoPlayer(videoPlayerController),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: Container(
          width: 60.w,
          height: 60.h,
          child: FloatingActionButton(
            backgroundColor: buttonColorOrang,
            onPressed: () {
              setState(() {
                videoPlayerController.value.isPlaying
                    ? videoPlayerController.pause()
                    : videoPlayerController.play();
              });
            },
            child: videoPlayerController.value.isPlaying
                ? SvgPicture.asset(
                    PLAY_STOP_SVG,
                    width: 20.w,
                    height: 20.h,
                    color: white,
                  )
                : SvgPicture.asset(
                    PLAY_SVG,
                    width: 20.w,
                    height: 20.h,
                  ),
          ),
        ));
  }
}
