import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/screens/screens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/widgets/music.dart';
import 'package:project_danso/widgets/widgets.dart';
// import 'package:just_audio/just_audio.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  // final SongController songController = Get.put(SongController());
  MainScreenController mainScreenController =
      Get.put(MainScreenController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: Text('한번 더 누르면 앱이 종료됩니다.'),
        ),
        child: GetBuilder<MainScreenController>(
            init: MainScreenController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // StreamBuilder<PlayerState>(
                    //     stream: controller.player.playerStateStream,
                    //     builder: (context, snapshot) {
                    //       final playerState = snapshot.data;
                    //       final processingState = playerState?.processingState;
                    //       final playing = playerState?.playing;
                    //       return
                    Stack(
                      children: [
                        topImage(controller),
                        stateButton(
                            onPressed: () {
                              controller.playOrPause();
                              controller.ChangeMuteButtonState();
                              // controller.MusicStateChange();

                              // if (playing != true) {
                              //   controller.player.play();
                              // } else if (processingState !=
                              //     ProcessingState.completed) {
                              //   controller.player.pause();
                              // }
                              // Get.to(Music());
                              // controller.musicState
                              //     ? controller.player.play()
                              //     : controller.player.pause();
                            },
                            musicState: controller.musicState),
                        imageChange(controller),
                        myPage(),
                      ],
                    ),
                    // }),
                    SizedBox(height: 20.h),
                    _homeMenuButton(
                        assetName: INFOR_SVG,
                        title: '단소 알아보기',
                        contant: LOOK,
                        page: MainDansoHistoryKindScreen()),
                    _homeMenuButton(
                        assetName: DANSO_TUNING_SVG,
                        title: '내 단소 기준음 잡기',
                        contant: VOLUMECONTROL,
                        page: FixDansoPitchDialog(),
                        dialog: true),
                    _homeMenuButton(
                        assetName: STUDY_SVG,
                        title: '운지법 익히기',
                        page: learningDialog(),
                        contant: LEARN,
                        dialog: true),
                    _homeMenuButton(
                        assetName: TUNE_SVG,
                        title: '연주곡 익히기',
                        contant: PLAYLEARN,
                        page: LearningSongListScreen()),
                    _homeMenuButton(
                        assetName: QandA_SVG,
                        title: 'Q&A',
                        contant: QUESTIONS,
                        page: QuestionsScreen()),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget stateButton({Function()? onPressed, required bool musicState}) {
    return Positioned(
      top: 30.h,
      left: 10.w,
      child: Container(
          width: 80.w,
          height: 22.h,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: logoColor.withOpacity(0),
                  side: BorderSide(color: white),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              onPressed: onPressed,
              child: Row(
                children: [
                  musicState
                      ? SvgPicture.asset(OFF_SVG)
                      : SvgPicture.asset(ON_SVG),
                  SizedBox(width: 3),
                  Text(
                    '배경음',
                    style: TextStyle(fontSize: 10.sp),
                  ),
                ],
              ))),
    );
  }

  Widget imageChange(MainScreenController controller) {
    return Positioned(
        top: 90,
        left: 50,
        child: Container(
          width: 100.w,
          height: 100.h,
          child: InkWell(
            onTap: () {
              controller.SvgStateChange();
            },
            child: Text(
              '',
              style: TextStyle(color: textBlack),
            ),
          ),
        ));
  }

  Container topImage(MainScreenController controller) {
    return Container(
        child: controller.svgState
            ? SvgPicture.asset(
                MAIN_ILL2_SVG,
                fit: BoxFit.fitWidth,
                width: ScreenUtil().screenWidth,
              )
            : SvgPicture.asset(
                MAIN_ILL1_SVG,
                fit: BoxFit.fitWidth,
                width: ScreenUtil().screenWidth,
              ));
  }

  Positioned myPage() {
    return Positioned.fill(
      bottom: Get.statusBarHeight - 95.h,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(
          onTap: () => Get.to(MyPageScreen()),
          child: Container(
            width: 150.w,
            height: 30.h,
            decoration: BoxDecoration(
                color: logoColor, borderRadius: BorderRadius.circular(40)),
            child: Center(
              child: Text(
                '마이페이지',
                style: TextStyle(color: white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _homeMenuButton(
      {required String title,
      required Widget page,
      required String contant,
      required String assetName,
      bool dialog = false,
      Function()? onPressed}) {
    return InkWell(
      onTap: () {
        var controller = Get.find<MainScreenController>();
        if (controller.muteButtonState) {
          // 아예 정지
          // Get.find<MainScreenController>().disposeAudioPlayer();
          // 일시 정지
          controller.assetsAudioPlayer.pause();
        }
        onPressed;
        if (dialog) {
          Get.dialog(page);
        } else {
          Get.to(page);
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 106.h,
        width: 330.w,
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(assetName),
              SizedBox(width: 14.w),
              Container(
                width: 190.w,
                height: 80.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$title',
                        style: TextStyle(
                            fontSize: textTitleSize.sp,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 7.h),
                    Text(contant, style: TextStyle(fontSize: 14.sp))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 35.h);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
