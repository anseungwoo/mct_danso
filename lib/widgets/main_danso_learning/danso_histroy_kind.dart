import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/widgets/widgets.dart';

class DansoHistroyKind extends StatelessWidget {
  //단소 유트뷰 제목 설명을 보여줌
  final String subject;
  final String explanation;
  final String url;

  DansoHistroyKind(
      {Key? key,
      required this.subject,
      required this.explanation,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayers(url: url),
            SizedBox(height: 20.h),
            titleDescription(),
          ],
        ),
      ),
    );
  }

  Container titleDescription() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MctSize.fifteen.getSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subject,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MctSize.seventeen.getSize.sp,
                fontFamily: NOTO_BOLD),
          ),
          SizedBox(height: 10.h),
          Text(
            explanation,
            style: TextStyle(
                fontSize: MctSize.fourteen.getSize.sp,
                fontFamily: NOTO_REGULAR),
          ),
        ],
      ),
    );
  }
}
