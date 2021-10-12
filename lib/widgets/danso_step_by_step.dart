import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/const.dart';

class DansoStepByStep extends StatelessWidget {
  const DansoStepByStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(basicPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(radius: 14, backgroundColor: Colors.black),
                SizedBox(
                  width: 7.sp,
                ),
                Text("왼손"),
                SizedBox(
                  width: 7.sp,
                ),
                CircleAvatar(radius: 14, backgroundColor: Colors.grey),
                SizedBox(width: 7.sp),
                Text("오른손"),
              ],
            ),
            SizedBox(height: 31.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.black26,
                  height: 400.h,
                  width: 100,
                  child: Center(child: Text("단소사진")),
                ),
                SizedBox(
                  width: basicPadding,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      color: Colors.black26,
                      height: 330.h,
                      width: 130.w,
                      child: Center(child: Text("전관부 사진???")),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                        height: 45.h,
                        width: 130.w,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("시작하기"))),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
