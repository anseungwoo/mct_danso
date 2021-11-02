import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget fingering() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(radius: 14, backgroundColor: Colors.black),
            SizedBox(
              width: 7.sp,
            ),
            Text('왼손', style: TextStyle(fontSize: 15.sp)),
            SizedBox(
              width: 7.sp,
            ),
            CircleAvatar(radius: 14, backgroundColor: Colors.grey),
            SizedBox(width: 7.sp),
            Text('오른손', style: TextStyle(fontSize: 15.sp)),
          ],
        ),
      ),
      Container(
        width: 320.w,
        height: 400.h,
        color: Colors.grey,
        child: Text('사진을 넣어주세요'),
      )
    ],
  );
}
