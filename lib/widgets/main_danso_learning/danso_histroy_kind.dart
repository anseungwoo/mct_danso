import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/widgets.dart';

class DansoHistroyKind extends StatefulWidget {
  final String subject;
  final String explanation;
  final String url;
  // final Image image;
  DansoHistroyKind(
      {Key? key,
      required this.subject,
      required this.explanation,
      required this.url})
      : super(key: key);

  @override
  _DansoHistroyKindState createState() => _DansoHistroyKindState();
}

class _DansoHistroyKindState extends State<DansoHistroyKind> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            YoutubePlayers(
              url: widget.url,
            ),
            SizedBox(height: 20.h),
            titleDescription(),
          ],
        ),
      ),
    );
  }

  Container titleDescription() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: basicPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.subject,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: textSevenSize.sp,
                fontFamily: NOTO_BOLD),
          ),
          SizedBox(height: 10.h),
          Text(widget.explanation,
              style: TextStyle(
                  fontSize: textBasicSize.sp, fontFamily: NOTO_REGULAR)),
        ],
      ),
    );
  }
}
