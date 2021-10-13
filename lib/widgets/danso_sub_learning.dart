import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/const.dart';

class DansosubLearning extends StatelessWidget {
  final String explanation;
  const DansosubLearning({Key key, @required this.explanation})
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
            margin: EdgeInsets.symmetric(horizontal: basicPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
