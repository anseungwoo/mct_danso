import 'dart:io';
import 'package:project_danso/widgets/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController videoPlayerController;
  Future<void> videoPlayerFuture;
  final File file = File(
      '/data/user/0/com.example.project_danso/cache/REC2329971791378890848.mp4');

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.file(file);
    videoPlayerFuture = videoPlayerController.initialize();
    videoPlayerController.setLooping(true);
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              videoPlayerController.value.isPlaying
                  ? videoPlayerController.pause()
                  : videoPlayerController.play();
            });
          },
          child: Icon(
            videoPlayerController.value.isPlaying
                ? Icons.pause
                : Icons.play_arrow,
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }
}
