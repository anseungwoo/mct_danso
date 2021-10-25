import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/const.dart';

class MyPageMysong extends StatelessWidget {
  const MyPageMysong({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: const EdgeInsets.all(basicPadding),
          itemCount: 16,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: basicPadding),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: mediumGray),
                height: 60.h,
                child: Padding(
                  padding: const EdgeInsets.all(stylePadddig),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Entry ${index}',
                        style:
                            TextStyle(fontSize: textStyleSize.sp, color: white),
                      ),
                      Spacer(flex: 1),
                      PopupMenuButton(
                          padding: EdgeInsets.only(
                            bottom: 3,
                          ),
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
  }
}
