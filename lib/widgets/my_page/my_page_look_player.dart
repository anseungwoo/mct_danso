import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/camera_record/camera_record_view_controller.dart';
import 'package:project_danso/screens/screens.dart';
import 'package:project_danso/widgets/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class VideoApp extends StatefulWidget {
  final videoFilePath;
  VideoApp({Key? key, required this.videoFilePath}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  // late VideoPlayerController videoPlayerController;
  // late Future<void> videoPlayerFuture;
  // var isFile = true;

  @override
  void initState() {
    super.initState();
    // asyncMethod();
    // File(widget.videoFilePath).existsSync()
    //     ? videoPlayerController =
    //         VideoPlayerController.file(File('${widget.videoFilePath}'))
    //     : Container();
    // videoPlayerFuture = videoPlayerController.initialize();
    // videoPlayerController.setLooping(true);
  }

  // void asyncMethod() async {
  //   var dir = (await getApplicationDocumentsDirectory()).path;
  //   if (Platform.isAndroid) {
  //     if (File(widget.videoFilePath).existsSync()) {
  //       videoPlayerController =
  //           VideoPlayerController.file(File('${widget.videoFilePath}'));

  //       videoPlayerFuture = videoPlayerController.initialize().then((_) {
  //         setState(() {});
  //       });
  //       videoPlayerController.setLooping(true);
  //     } else {
  //       isFile = false;
  //     }
  //   } else if (Platform.isIOS) {
  //     if (File(widget.videoFilePath).existsSync()) {
  //       print('ios video filename : ${widget.videoFilePath}');
  //       videoPlayerController = VideoPlayerController.file(
  //           File('$dir/camera/videos/${widget.videoFilePath}'));

  //       videoPlayerFuture = videoPlayerController.initialize().then((_) {
  //         setState(() {});
  //       });
  //       videoPlayerController.setLooping(true);
  //     } else {
  //       isFile = false;
  //     }
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
    // videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cameraRecordViewController =
        Get.put(CameraRecordViewController(path: widget.videoFilePath));
    return Scaffold(
        appBar:
            tabbarAndAppBar(title: '내연주 보기', tabbar: null, enableTabBar: false),
        body: FutureBuilder(
          future: cameraRecordViewController.videoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: cameraRecordViewController
                    .videoPlayerController!.value.aspectRatio,
                child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: VideoPlayer(
                        cameraRecordViewController.videoPlayerController!)),
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
                cameraRecordViewController
                        .videoPlayerController!.value.isPlaying
                    ? cameraRecordViewController.videoPlayerController!.pause()
                    : cameraRecordViewController.videoPlayerController!.play();
              });
            },
            child: cameraRecordViewController
                    .videoPlayerController!.value.isPlaying
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
