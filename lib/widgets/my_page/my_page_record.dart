import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/widgets.dart';

class MyPageRecord extends StatelessWidget {
  final String songname;

  const MyPageRecord({Key? key, required this.songname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tabbarAndAppBar(title: '내기록', tabbar: null, enableTabBar: false),
      body: Container(
        child: ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: 16,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: basicPadding,
                ),
                child: InkWell(
                  onTap: () {
                    // Get.bottomSheet(bottomsheet());
                    bottomsheet(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: buttonColorYellow),
                    height: 60.h,
                    child: Padding(
                      padding: const EdgeInsets.all(svenPadddig),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Entry $index',
                            style: TextStyle(
                                fontSize: textEightSize.sp,
                                color: white,
                                fontFamily: NOTO_MEDIUM),
                          ),
                          Spacer(flex: 1),
                          Container(
                              width: 33,
                              height: 33,
                              child: SvgPicture.asset(GRAPH_SVG))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
