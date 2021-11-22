import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';

import 'package:project_danso/widgets/widgets.dart';

class MyPageLook extends StatelessWidget {
  final String songname;
  final String date;
  const MyPageLook({Key? key, required this.songname, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tabbarAndAppBar(title: "내기록", tabbar: null, enableTabBar: false),
      body: GetBuilder<MyPageController>(
          init: MyPageController(),
          builder: (controller) {
            return Container(
              child: ListView.builder(
                  padding: const EdgeInsets.all(basicPadding),
                  itemCount: 16,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: basicPadding),
                      child: InkWell(
                        onTap: () {
                          Get.to(VideoApp());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: buttonColorYellow),
                          height: 60.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 17, top: 10, right: 17, bottom: 3),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '$songname $index',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: textEightSize.sp,
                                        color: white,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      date,
                                      style: TextStyle(color: white),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(flex: 1),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: iconPadding),
                                child: PopupMenuButton(
                                  onSelected: (value) {
                                    if (value == 1) {}
                                    if (value == 2) {
                                      Get.dialog(myPageDeleteDialog());
                                    }
                                  },
                                  child: Container(
                                      width: 30.w,
                                      height: 30.h,
                                      child: SvgPicture.asset(SEE_MORE_SVG)),
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: Text('공유하기'),
                                      value: 1,
                                    ),
                                    PopupMenuItem(
                                      child: Text('삭제하기'),
                                      value: 2,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }),
    );
  }
}
