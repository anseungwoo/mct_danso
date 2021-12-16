import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/my_history_controller.dart';
import 'package:project_danso/widgets/widgets.dart';

class MyPageChallangeHistory extends StatefulWidget {
  final String songname;

  MyPageChallangeHistory({Key? key, required this.songname}) : super(key: key);

  @override
  State<MyPageChallangeHistory> createState() => _MyPageChallangeHistoryState();
}

class _MyPageChallangeHistoryState extends State<MyPageChallangeHistory> {
  final _myHistoryController = Get.put(MyHistoryController());

  @override
  void initState() {
    super.initState();
    _myHistoryController.getMyHistoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tabbarAndAppBar(title: '내기록', tabbar: null, enableTabBar: false),
      body: GetBuilder<MyHistoryController>(
          init: _myHistoryController,
          builder: (controller) {
            return ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: controller.reversedHistoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = controller.reversedHistoryList[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: basicPadding,
                    ),
                    child: InkWell(
                      onTap: () async {
                        // Get.bottomSheet(bottomsheet());
                        await controller.getMyHistoryGraphList(item.songId);
                        bottomsheet(context, item.songTitle,
                            controller.reversedHistoryGraphList);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: buttonColorYellow),
                        height: 60.h,
                        child: Padding(
                          padding: const EdgeInsets.all(svenPadddig),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '${item.songTitle}',
                                style: TextStyle(
                                    fontSize: textEightSize.sp,
                                    color: white,
                                    fontFamily: NOTO_MEDIUM),
                              ),
                              Spacer(flex: 1),
                              Container(
                                  width: 33,
                                  height: 33,
                                  child: SvgPicture.asset(
                                    GRAPH_SVG,
                                    width: 24.w,
                                    height: 24.h,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
