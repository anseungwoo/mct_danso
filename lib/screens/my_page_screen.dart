import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/widgets.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  var controller = Get.find<MainScreenController>();
  var tearController = Get.put(TearController());

  @override
  void initState() {
    super.initState();
    if (controller.musicState) {
      // 아예 정지
      // Get.find<MainScreenController>().disposeAudioPlayer();
      // 일시 정지
      controller.assetsAudioPlayer.pause();
    }
    tearController.getTearInfo();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    if (controller.musicState) {
      controller.assetsAudioPlayer.play();
    }
    tearController.getTearInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          tabbarAndAppBar(title: '마이페이지', tabbar: null, enableTabBar: false),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset(
                  tearController.emblemAsset,
                  width: 100.w,
                  height: 100.h,
                )),
            Text(
              tearController.tearName,
              style: TextStyle(
                  fontSize: MctSize.eighteen.getSize.sp,
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
                        fontSize: MctSize.fourteen.getSize.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: NOTO_REGULAR),
                  ),
                  Container(
                    // width: 330.w,
                    height: 5.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value:
                            tearController.userExp / tearController.nextTearExp,
                        backgroundColor: MctColor.expColor.getMctColor,
                        color: MctColor.lightYellow.getMctColor,
                      ),
                    ),
                  ),
                  // 점수 체크용. 나중에 삭제해도 됨.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${tearController.userExp.ceil()}',
                        style: TextStyle(fontSize: MctSize.fourteen.getSize.sp),
                      ),
                      Text(
                        '${tearController.nextTearExp.ceil()}',
                        style: TextStyle(fontSize: MctSize.fourteen.getSize.sp),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 31.h),
            // const Spacer(),
            myPageButton(
                MY_RECORD_SVG, '내기록', MyPageChallangeHistory(songname: '곡이름')),
            myPageButton(BOOKMARK_SVG, '관심곡', MyPageLike(songname: '곡이름')),
            myPageButton(
                MP3_SVG, '연주듣기', MyPageListen(songname: '곡이름', date: '날짜')),
            myPageButton(
                VIDEO_SVG, '연주보기', MyPageLook(songname: '곡이름', date: '날짜')),
          ],
        ),
      ),
    );
  }

  Widget myPageButton(String assetName, String title, Widget page) => Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: 330.w,
          height: 60.h,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: MctColor.buttonColorYellow.getMctColor,
                  elevation: 0),
              onPressed: () {
                Get.to(page);
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SvgPicture.asset(
                      assetName,
                      height: 25.h,
                      width: 25.w,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: MctSize.eighteen.getSize.sp,
                        fontFamily: NOTO_MEDIUM),
                  ),
                ],
              )),
        ),
      );
}
