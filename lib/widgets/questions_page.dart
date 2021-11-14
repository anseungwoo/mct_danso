import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/base_widgets/tabbar_and_appbar.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tabbarAndAppBar(title: "Q&A", enableTabBar: false, tabbar: null),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: ListView.builder(
            itemCount: 60,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(basicPadding),
                child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: 330.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                          color: grayBlackColor,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        "질문내용이에요",
                        style:
                            TextStyle(color: white, fontSize: textEightSize.sp),
                      )),
                    )),
              );
            }),
      ),
    );
  }
}
