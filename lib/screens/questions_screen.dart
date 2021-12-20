import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/widgets.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var controller = Get.find<MainScreenController>();

  @override
  void dispose() {
    super.dispose();

    if (controller.musicState) {
      controller.assetsAudioPlayer.play();
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: tabbarAndAppBar(
            title: 'Q&A와 팁',
            tabbar: defaultTabBar(tabList: [
              TabText('Q&A'),
              TabText('팁'),
            ])),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MctSize.fifteen.getSize),
              child: Container(
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                child: ListView.builder(
                    itemCount: Q_AND_A_TITLE.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: MctSize.fifteen.getSize),
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
                                  color: MctColor.buttonColorYellow.getMctColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding:
                                    EdgeInsets.all(MctSize.seventeen.getSize),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      Q_AND_A_SVG,
                                      width: 20.w,
                                      height: 20.h,
                                    ),
                                    SizedBox(width: MctSize.fifteen.getSize),
                                    Text(
                                      '${Q_AND_A_TITLE[index]}',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: MctColor.white.getMctColor,
                                          fontSize: MctSize.fifteen.getSize.sp,
                                          fontFamily: NOTO_MEDIUM),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      );
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MctSize.fifteen.getSize),
              child: Container(
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                child: ListView.builder(
                    itemCount: TIP_TITLE.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: MctSize.fifteen.getSize),
                        child: InkWell(
                            onTap: () {
                              Get.to(QAndAPAGE(
                                subject: TIP_TITLE[index],
                                explanation: TIP_SUB_CONTANT[index],
                                url: TIP_URL[index],
                                startSecond: TIP_TIME[index],
                              ));
                            },
                            child: Container(
                              width: 330.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                  color: MctColor.buttonColorYellow.getMctColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding:
                                    EdgeInsets.all(MctSize.seventeen.getSize),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      TIP_SVG,
                                      width: 20.w,
                                      height: 20.h,
                                    ),
                                    SizedBox(width: MctSize.fifteen.getSize),
                                    Text(
                                      TIP_TITLE[index],
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: MctColor.white.getMctColor,
                                          fontSize: MctSize.sixteen.getSize.sp,
                                          fontFamily: NOTO_MEDIUM),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
