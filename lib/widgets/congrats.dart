import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/widgets.dart';

class ResultScore extends StatelessWidget {
  const ResultScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: textBlack,
              ))
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(basicPadding),
        child: Container(
          width: 70.w,
          height: 70.h,
          child: FloatingActionButton(
            onPressed: () {
              Get.off(SongGraph());
            },
            child: Text('그래프아이콘'),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 50.h),
          Center(
              child: Container(
                  width: 250.w,
                  height: 250.h,
                  child: SvgPicture.asset(STAR_SVG[0]))),
          Text(
            '점수(점수)',
            style: TextStyle(
                fontSize: textSingleSize, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: basicPadding),
          Text(
            '완벽해요!',
            style: TextStyle(fontSize: textEightSize.sp),
          ),
        ],
      ),
    );
  }
}
