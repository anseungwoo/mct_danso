import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/widgets.dart';

class MyPageListen extends StatelessWidget {
  final String songname;
  final String date;
  const MyPageListen({Key? key, required this.songname, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tabbarAndAppBar(title: '연주듣기', tabbar: null, enableTabBar: false),
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
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: buttonColorYellow),
                        height: 60.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: basicPadding),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '$songname $index',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: textEightSize.sp,
                                        color: white,
                                        fontFamily: NOTO_MEDIUM),
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
                            InkWell(
                                radius: 40.r,
                                onTap: () {
                                  Get.dialog(MyPageListenDialog());
                                },
                                child: SvgPicture.asset(
                                  PLAY_SVG,
                                  width: 15.w,
                                  height: 15.h,
                                )),
                            SizedBox(width: 10.w),
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
                                    child: SvgPicture.asset(
                                  SEE_MORE_SVG,
                                  width: 40.w,
                                  height: 25.h,
                                )),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 1,
                                    child: Text(
                                      '공유하기',
                                      style:
                                          TextStyle(fontFamily: NOTO_REGULAR),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 2,
                                    child: Text(
                                      '삭제하기',
                                      style:
                                          TextStyle(fontFamily: NOTO_REGULAR),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }),
    );
  }
}
