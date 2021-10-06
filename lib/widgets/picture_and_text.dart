import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PictureAndText extends StatelessWidget {
  final String subject;
  final String Explanation;
  // final Image image;
  const PictureAndText(
      {Key? key, required this.subject, required this.Explanation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            height: 212.h,
            width: 330.w,
            color: Colors.grey,
            child: Center(child: Text('사진1')),
          ),
          SizedBox(height: 20.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(Explanation, style: TextStyle(fontSize: 15.sp)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
