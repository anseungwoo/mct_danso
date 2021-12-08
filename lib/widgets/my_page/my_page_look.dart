import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/audio_and_video_list_controller.dart';
import 'package:project_danso/controllers/audio_and_video_record_controller.dart';
import 'package:project_danso/controllers/controllers.dart';

import 'package:project_danso/widgets/widgets.dart';

class MyPageLook extends StatelessWidget {
  final String songname;
  final String date;

  MyPageLook({Key? key, required this.songname, required this.date})
      : super(key: key);

  final audioAndVideoListController = Get.put(AudioAndVideoListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tabbarAndAppBar(title: '연주보기', tabbar: null, enableTabBar: false),
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(basicPadding),
          reverse: true,
          shrinkWrap: true,
          itemCount: audioAndVideoListController.videoList.length,
          itemBuilder: (BuildContext context, int index) {
            var item = audioAndVideoListController.videoList[index];
            if (audioAndVideoListController.videoList.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(bottom: basicPadding),
                child: InkWell(
                  onTap: () {
                    Get.to(VideoApp(
                      videoFilePath: item.exerPath,
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: buttonColorYellow),
                    height: 60.h,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
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
                                audioAndVideoListController
                                    .convertDateFormat(item.exerTime),
                                style: TextStyle(color: white),
                              ),
                            ],
                          ),
                        ),
                        Spacer(flex: 1),
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
    );
  }
}
