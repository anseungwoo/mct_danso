import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DansoLearning extends StatelessWidget {
  final String subject;
  final String Explanation;
  // final Image image;
  const DansoLearning({
    Key? key,
    required this.subject,
    required this.Explanation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 312.h,
            width: 148.w,
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(Explanation,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 15.sp,
                    )),
              ],
            ),
          ),
          Container(
            height: 360.h,
            width: 165.w,
            color: Colors.grey,
            child: Center(child: Text('사진1')),
          ),
        ],
      ),
    );
  }
}

class DansosubLearning extends StatelessWidget {
  final String Explanation;
  const DansosubLearning({Key? key, required this.Explanation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 340.h,
            width: 155.w,
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Explanation,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 15.sp,
                    )),
              ],
            ),
          ),
          Container(
            height: 360.h,
            width: 165.w,
            color: Colors.grey,
            child: Center(child: Text('사진1')),
          ),
        ],
      ),
    );
  }
}
