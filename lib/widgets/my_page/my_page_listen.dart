import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/audio_and_video_list_controller.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/widgets.dart';

class MyPageListen extends StatelessWidget {
  final String songname;
  final String date;

  MyPageListen({Key? key, required this.songname, required this.date})
      : super(key: key);

  final audioAndVideoListController = Get.put(AudioAndVideoListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tabbarAndAppBar(title: '연주듣기', tabbar: null, enableTabBar: false),
      body: Obx(
        () => Align(
          alignment: Alignment.topCenter,
          child: ListView.builder(
            padding: const EdgeInsets.all(basicPadding),
            reverse: true,
            shrinkWrap: true,
            itemCount: audioAndVideoListController.audioList.length,
            itemBuilder: (BuildContext context, int index) {
              var item = audioAndVideoListController.audioList[index];
              print(audioAndVideoListController.audioList[0].exerPath);
              if (audioAndVideoListController.audioList.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: basicPadding),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: buttonColorYellow),
                    height: 60.h,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: basicPadding),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${item.songTitle}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: textEightSize.sp,
                                    color: white,
                                    fontFamily: NOTO_MEDIUM),
                              ),
                              SizedBox(height: 2),
                              Text(
                                // '${item.exerTime}',
                                '${audioAndVideoListController.convertDateFormat(item.exerTime)}',
                                // '2021년 12월 07일 오전 09시 08분',
                                style: TextStyle(color: white),
                              ),
                            ],
                          ),
                        ),
                        Spacer(flex: 1),
                        InkWell(
                            radius: 40.r,
                            onTap: () {
                              Get.dialog(MyPageListenDialog(
                                recordItem: item,
                              ));
                            },
                            child: SvgPicture.asset(
                              PLAY_SVG,
                              width: 20.w,
                              height: 20.w,
                            )),
                        // SizedBox(width: 10.w),
                        PopupMenuButton(
                          onSelected: (value) {
                            if (value == 1) {}
                            if (value == 2) {
                              Get.dialog(myPageDeleteDialog());
                            }
                          },
                          child: Container(
                              // color: Colors.grey,
                              height: 25.w,
                              width: 40.w,
                              margin: EdgeInsets.only(right: 10, left: 10),
                              child: SvgPicture.asset(
                                SEE_MORE_SVG,
                                // width: 40.w,
                                // height: 25.h,
                                fit: BoxFit.contain,
                              )),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Text(
                                '공유하기',
                                style: TextStyle(fontFamily: NOTO_REGULAR),
                              ),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: Text(
                                '삭제하기',
                                style: TextStyle(fontFamily: NOTO_REGULAR),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Container(
                  height: 200.h,
                  child: Center(
                    child: Text('없음'),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
