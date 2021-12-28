import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/widgets/widgets.dart';

class QAndAPage extends StatelessWidget {
  final String subject;
  final String explanation;
  final String url;
  final double startSecond;

  QAndAPage(
      {Key? key,
      required this.subject,
      required this.explanation,
      required this.url,
      required this.startSecond})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tabbarAndAppBar(title: 'Q&A', tabbar: null, enableTabBar: false),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubePlayers(
                url: url,
                startSeconds: startSecond,
              ),
              SizedBox(height: 20.h),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: MctSize.fifteen.getSize),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subject,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MctSize.seventeen.getSize.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(explanation,
                        style:
                            TextStyle(fontSize: MctSize.fourteen.getSize.sp)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
