import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/my_page_controller.dart';
import 'package:project_danso/widgets/my_page_listen_dialog.dart';

class MyPageListen extends StatelessWidget {
  final String songname;
  final String date;
  const MyPageListen({Key key, @required this.songname, @required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyPageController>(
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
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: mediumGray),
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
                                    '${songname} ${index}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: textStyleSize.sp,
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
                            IconButton(
                              padding: EdgeInsets.only(bottom: 6),
                              onPressed: () {
                                Get.dialog(myPageListenDialog());
                              },
                              icon: Icon(
                                Icons.play_arrow,
                                size: 40,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            PopupMenuButton(
                                icon: Icon(Icons.more_vert_outlined),
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                        child: Text("공유하기"),
                                        value: 1,
                                      ),
                                      PopupMenuItem(
                                        child: Text("삭제하기"),
                                        value: 2,
                                      )
                                    ]),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        });
  }
}
