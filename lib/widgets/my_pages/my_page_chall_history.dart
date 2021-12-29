import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';

import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/widgets.dart';

class MyPageChallangeHistory extends GetView<MyHistoryController> {
  final String songname;

  MyPageChallangeHistory({Key? key, required this.songname}) : super(key: key);
  final myHistoryController = Get.put(MyHistoryController());
  @override
  Widget build(BuildContext context) {
    myHistoryController.getMyHistoryList();
    return Scaffold(
      appBar: tabbarAndAppBar(title: '내기록', tabbar: null, enableTabBar: false),
      body: GetBuilder<MyHistoryController>(
        init: controller,
        builder: (controller) {
          return ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: controller.reversedHistoryList.length,
            itemBuilder: (BuildContext context, int index) {
              var item = controller.reversedHistoryList[index];
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MctSize.fifteen.getSize,
                ),
                child: InkWell(
                  onTap: () async {
                    await controller.getMyHistoryGraphList(item.songId);
                    bottomsheet(context, item.songTitle,
                        controller.reversedHistoryGraphList);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: MctColor.buttonColorYellow.getMctColor),
                    height: 60.h,
                    child: Padding(
                      padding: EdgeInsets.all(MctSize.seventeen.getSize),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${item.songTitle}',
                            style: TextStyle(
                                fontSize: MctSize.eighteen.getSize.sp,
                                color: MctColor.white.getMctColor,
                                fontFamily: NOTO_MEDIUM),
                          ),
                          Spacer(flex: 1),
                          Container(
                            width: 33.w,
                            height: 33.w,
                            child: SvgPicture.asset(
                              GRAPH_SVG,
                              width: 24.w,
                              height: 24.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
