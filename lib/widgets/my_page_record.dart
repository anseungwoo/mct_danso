import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/widgets.dart';

class MyPageRecord extends StatelessWidget {
  final String songname;

  final int score;
  const MyPageRecord({Key? key, required this.songname, required this.score})
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
                onTap: () {
                  // Get.bottomSheet(bottomsheet());
                  bottomsheet(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: mediumGray),
                  height: 60.h,
                  child: Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Entry ${index}',
                          style: TextStyle(fontSize: 18, color: white),
                        ),
                        Spacer(flex: 1),
                        Text(
                          "점수",
                          style: TextStyle(fontSize: 14, color: white),
                        ),
                        SizedBox(width: 6.w),
                        Container(
                          width: 33,
                          height: 33,
                          child: Text(
                            "그래프 디자인",
                            style: TextStyle(fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
