import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/utils/date_format.dart';
import 'package:project_danso/widgets/widgets.dart';

class MyPageLook extends GetView<AudioAndVideoListController> {
  final String songname;
  final String date;

  MyPageLook({Key? key, required this.songname, required this.date})
      : super(key: key);
  final audioAndVideoListController = Get.put(AudioAndVideoListController());

  @override
  Widget build(BuildContext context) {
    controller.getVideoList();
    return Scaffold(
      appBar: tabbarAndAppBar(title: '연주보기', tabbar: null, enableTabBar: false),
      body: Obx(
        () => ListView.builder(
          padding: EdgeInsets.all(MctSize.fifteen.getSize),
          reverse: true,
          shrinkWrap: true,
          itemCount: controller.videoList.length,
          itemBuilder: (BuildContext context, int index) {
            var item = controller.videoList[index];
            if (controller.videoList.isNotEmpty) {
              print('${item.exerPath}');
              return Padding(
                padding: EdgeInsets.only(bottom: MctSize.fifteen.getSize),
                child: InkWell(
                  onTap: () async {
                    var dir = (await getApplicationDocumentsDirectory()).path;
                    await Get.toNamed('/video',
                        arguments: Platform.isIOS
                            ? '$dir/camera/videos/${item.exerPath}'
                            : item.exerPath);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: MctColor.buttonColorYellow.getMctColor),
                    height: 60.h,
                    child: Row(
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
                                convertDateFormat(item.exerTime),
                                style: TextStyle(
                                    color: MctColor.white.getMctColor),
                              ),
                            ],
                          ),
                        ),
                        Spacer(flex: 1),
                        PopupMenuButton(
                          onSelected: (value) async {
                            if (value == 1) {
                              controller.shareFile(item.exerPath);
                            }
                            if (value == 2) {
                              var dir =
                                  (await getApplicationDocumentsDirectory())
                                      .path;

                              await Get.dialog(myPageDeleteDialog(
                                  Platform.isIOS
                                      ? '$dir/camera/videos/${item.exerPath}'
                                      : item.exerPath,
                                  item.exerId));
                            }
                          },
                          child: Container(
                              height: 25.w,
                              width: 40.w,
                              margin: EdgeInsets.only(right: 10, left: 10),
                              child: SvgPicture.asset(
                                SEE_MORE_SVG,
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
