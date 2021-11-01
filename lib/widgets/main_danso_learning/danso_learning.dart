import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/const.dart';

class DansoLearning extends StatelessWidget {
  final String subject;
  final String explanation;
  // final Image image;
  DansoLearning({
    Key key,
    @required this.subject,
    @required this.explanation,
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
            margin: EdgeInsets.symmetric(horizontal: basicPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: textContantSize.sp,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(explanation, softWrap: true),
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
