import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/common.dart';

//사진이랑 제목 설명 위한 위젯
class PictureAndText extends StatelessWidget {
  String title;
  String image;
  String contant;
  PictureAndText(
      {Key? key,
      required this.contant,
      required this.image,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 30.h),
          Container(
            height: 212.h,
            width: ScreenUtil().screenWidth.w,
            child: Image.asset(
              image,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: MctSize.fifteen.getSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(contant,
                    style: TextStyle(fontSize: MctSize.fourteen.getSize.sp)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
