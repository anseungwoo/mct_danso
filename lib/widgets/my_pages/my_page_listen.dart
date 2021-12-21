import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/utils/date_format.dart';
import 'package:project_danso/widgets/widgets.dart';

class MyPageListen extends StatefulWidget {
  final String songname;
  final String date;

  MyPageListen({Key? key, required this.songname, required this.date})
      : super(key: key);

  @override
  State<MyPageListen> createState() => _MyPageListenState();
}

class _MyPageListenState extends State<MyPageListen> {
  final audioAndVideoListController = Get.put(AudioAndVideoListController());
  @override
  void initState() {
    audioAndVideoListController.onInit();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tabbarAndAppBar(title: '연주듣기', tabbar: null, enableTabBar: false),
      body: Obx(
        () => Align(
          alignment: Alignment.topCenter,
          child: ListView.builder(
            padding: EdgeInsets.all(MctSize.fifteen.getSize),
            reverse: true,
            shrinkWrap: true,
            itemCount: audioAndVideoListController.audioList.length,
            itemBuilder: (BuildContext context, int index) {
              var item = audioAndVideoListController.audioList[index];
              print(audioAndVideoListController.audioList[0].exerPath);
              if (audioAndVideoListController.audioList.isNotEmpty) {
                return Padding(
                  padding: EdgeInsets.only(bottom: MctSize.fifteen.getSize),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: MctColor.buttonColorYellow.getMctColor),
                    height: 60.h,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MctSize.fifteen.getSize),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${item.songTitle}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: MctSize.eighteen.getSize.sp,
                                    color: MctColor.white.getMctColor,
                                    fontFamily: NOTO_MEDIUM),
                              ),
                              SizedBox(height: 2),
                              Text(
                                // '${item.exerTime}',
                                '${convertDateFormat(item.exerTime)}',
                                // '2021년 12월 07일 오전 09시 08분',
                                style: TextStyle(
                                    color: MctColor.white.getMctColor),
                              ),
                            ],
                          ),
                        ),
                        Spacer(flex: 1),
                        InkWell(
                            radius: 40.r,
                            onTap: () async {
                              var dir =
                                  (await getApplicationDocumentsDirectory())
                                      .path;
                              await Get.dialog(MyPageListenDialog(
                                recordItem: Platform.isIOS
                                    ? '$dir/${item.exerPath}'
                                    : item.exerPath,
                              ));
                            },
                            child: SvgPicture.asset(
                              PLAY_SVG,
                              width: 20.w,
                              height: 20.w,
                            )),
                        // SizedBox(width: 10.w),
                        PopupMenuButton(
                          onSelected: (value) async {
                            if (value == 1) {
                              audioAndVideoListController
                                  .shareFile(item.exerPath);
                            }
                            if (value == 2) {
                              var dir =
                                  (await getApplicationDocumentsDirectory())
                                      .path;

                              await Get.dialog(myPageDeleteDialog(
                                  Platform.isIOS
                                      ? '$dir/${item.exerPath}'
                                      : item.exerPath,
                                  item.exerId));
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
