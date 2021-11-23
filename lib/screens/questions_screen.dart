import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/pitch.dart';
import 'package:project_danso/widgets/widgets.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: tabbarAndAppBar(
            title: "Q&A",
            tabbar: defaultTabBar(tabList: [
              Tab(text: "Q&A"),
              Tab(text: "팁"),
            ])),
        body: TabBarView(
          children: [
            Container(
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              child: ListView.builder(
                  itemCount: Q_AND_A_TITLE.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(basicPadding),
                      child: InkWell(
                          onTap: () {
                            Get.to(QAndAPAGE(
                              subject: Q_AND_A_TITLE[index],
                              explanation: Q_AND_A_SUB_CONTANT[index],
                              url: Q_AND_A_URL[index],
                              startSecond: Q_AND_A_TIME[index],
                            ));
                          },
                          child: Container(
                            width: 330.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                                color: buttonColorYellow,
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(svenPadddig),
                              child: Text(
                                Q_AND_A_TITLE[index],
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: white, fontSize: textEightSize.sp),
                              ),
                            ),
                          )),
                    );
                  }),
            ),
            Container(
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              child: ListView.builder(
                  itemCount: Q_AND_A_TITLE.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(basicPadding),
                      child: InkWell(
                          onTap: () {
                            Get.to(QAndAPAGE(
                              subject: Q_AND_A_TITLE[index],
                              explanation: Q_AND_A_SUB_CONTANT[index],
                              url: Q_AND_A_URL[index],
                              startSecond: Q_AND_A_TIME[index],
                            ));
                          },
                          child: Container(
                            width: 330.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                                color: buttonColorYellow,
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(svenPadddig),
                              child: Text(
                                Q_AND_A_TITLE[index],
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: white, fontSize: textEightSize.sp),
                              ),
                            ),
                          )),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
