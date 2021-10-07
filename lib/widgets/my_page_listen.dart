import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/const.dart';

class MyPageListen extends StatelessWidget {
  final String songname;
  final String date;
  const MyPageListen({Key? key, required this.songname, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: 16,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
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
                                fontSize: 18,
                                color: white,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '${date}점',
                              style: TextStyle(fontSize: 14, color: white),
                            ),
                          ],
                        ),
                      ),
                      Spacer(flex: 1),
                      IconButton(
                          padding: EdgeInsets.only(bottom: 6),
                          onPressed: () {},
                          icon: Icon(
                            Icons.play_arrow,
                            size: 40,
                          )),
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
  }
}
