import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/color.dart';
import 'package:project_danso/common/contant.dart';
import 'package:project_danso/common/icon.dart';
import 'package:project_danso/common/size.dart';
import 'package:project_danso/controllers/my_history_controller.dart';
import 'package:project_danso/utils/date_format.dart';
import 'package:project_danso/widgets/widgets.dart';

class SongGraph extends StatefulWidget {
  SongGraph({Key? key, required this.songId, required this.songTitle})
      : super(key: key);
  final songId;
  final songTitle;

  @override
  State<SongGraph> createState() => _SongGraphState();
}

class _SongGraphState extends State<SongGraph> {
  final MyHistoryController _myHistoryController =
      Get.put(MyHistoryController());

  @override
  void initState() {
    super.initState();
    _myHistoryController.getMyHistoryGraphList(widget.songId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: songtabbarAndAppBar(
          title: '${widget.songTitle}', tabbar: null, enableTabBar: false),
      body: GetBuilder<MyHistoryController>(
          init: _myHistoryController,
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.all(MctSize.fifteen.getSize),
              child: Container(
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                child: ListView.builder(
                    itemCount: controller.reversedHistoryGraphList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.reversedHistoryGraphList[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: MctSize.fifteen.getSize),
                            child: Text(
                              convertDateFormat(item.chalTime),
                              style: TextStyle(
                                  fontSize: MctSize.eighteen.getSize.sp,
                                  fontFamily: NOTO_REGULAR),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: (ScreenUtil().screenWidth / 100) *
                                (item.chalScore)!.toInt(),
                            height: 35.h,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      MctColor.gradationColorYellow.getMctColor,
                                      MctColor.lightYellow.getMctColor,
                                    ])),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(right: MctSize.seven.getSize),
                              child: Text(
                                '${item.chalScore}점',
                                style: TextStyle(
                                    fontSize: MctSize.fifteen.getSize.sp,
                                    fontFamily: NOTO_BOLD),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
              ),
            );
          }),
    );
  }
}
