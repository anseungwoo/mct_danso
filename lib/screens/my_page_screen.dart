import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/controllers/tear_controller.dart';
import 'package:project_danso/widgets/widgets.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  var controller = Get.find<MainScreenController>();
  TearController tearController = Get.put(TearController());

  @override
  void initState() {
    super.initState();
    tearController.getTearInfo();
    if (controller.musicState) {
      // 아예 정지
      // Get.find<MainScreenController>().disposeAudioPlayer();
      // 일시 정지
      controller.assetsAudioPlayer.pause();
    }
  }

  @override
  void dispose() {
    super.dispose();

    if (controller.musicState) {
      controller.assetsAudioPlayer.play();
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          tabbarAndAppBar(title: '마이페이지', tabbar: null, enableTabBar: false),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    tearController.emblemAsset.value,
                    width: 100.w,
                    height: 100.h,
                  )),
              Text(
                tearController.tearName.value,
                style: TextStyle(
                    fontSize: textEightSize,
                    fontWeight: bold,
                    fontFamily: NOTO_BOLD),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '다음 랭크까지',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: NOTO_REGULAR),
                    ),
                    Container(
                      // width: 330.w,
                      height: 5.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          value: tearController.userExp /
                              tearController.nextTearExp.value,
                          backgroundColor: expColor,
                          color: mainColor,
                        ),
                      ),
                    ),
                    // 점수 체크용. 나중에 삭제해도 됨.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${tearController.userExp.value}'),
                        Text('${tearController.nextTearExp.value}'),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 31.h),
              // const Spacer(),
              myPageButton(SvgPicture.asset(MY_RECORD_SVG), '내기록',
                  MyPageRecord(songname: '곡이름')),
              myPageButton(SvgPicture.asset(BOOKMARK_SVG), '관심곡',
                  MyPageLike(songname: '곡이름')),
              myPageButton(SvgPicture.asset(MP3_SVG), '연주듣기',
                  MyPageListen(songname: '곡이름', date: '날짜')),
              myPageButton(SvgPicture.asset(VIDEO_SVG), '연주보기',
                  MyPageLook(songname: '곡이름', date: '날짜')),
            ],
          ),
        ),
      ),
    );
  }

  Widget myPageButton(SvgPicture myicon, String title, Widget page) => Padding(
        padding: const EdgeInsets.all(7),
        child: Container(
          width: 330.w,
          height: 60.h,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: buttonColorYellow, elevation: 0),
              onPressed: () {
                Get.to(page);
              },
              child: Row(
                children: [
                  myicon,
                  SizedBox(width: 27.w),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: textEightSize.sp, fontFamily: NOTO_MEDIUM),
                  ),
                ],
              )),
        ),
      );
}
