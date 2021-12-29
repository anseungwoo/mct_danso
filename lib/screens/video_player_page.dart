import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/widgets/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class VideoAppScreen extends StatefulWidget {
  //녹화 영상을 볼수 있는 페이지
  VideoAppScreen({
    Key? key,
  }) : super(key: key);

  @override
  _VideoAppScreenState createState() => _VideoAppScreenState();
}

class _VideoAppScreenState extends State<VideoAppScreen> {
  late VideoPlayerController videoPlayerController;

  var isFile = true;

  @override
  void initState() {
    super.initState();
    print(Get.arguments);

    if (File(Get.arguments).existsSync()) {
      videoPlayerController =
          VideoPlayerController.file(File('${Get.arguments}'));

      videoPlayerController.initialize();
      videoPlayerController.setLooping(true);
    } else {
      isFile = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (isFile) {
      videoPlayerController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          tabbarAndAppBar(title: '내연주 보기', tabbar: null, enableTabBar: false),
      body: isFile
          ? AspectRatio(
              aspectRatio: videoPlayerController.value.aspectRatio,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: VideoPlayer(videoPlayerController),
              ),
            )
          : Center(
              child: Text('nodata'),
            ),
      floatingActionButton: isFile
          ? Container(
              width: 60.w,
              height: 60.h,
              child: FloatingActionButton(
                backgroundColor: MctColor.buttonColorOrange.getMctColor,
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
                        color: MctColor.white.getMctColor,
                      )
                    : SvgPicture.asset(
                        PLAY_SVG,
                        width: 20.w,
                        height: 20.h,
                      ),
              ),
            )
          : Container(),
    );
  }
}
