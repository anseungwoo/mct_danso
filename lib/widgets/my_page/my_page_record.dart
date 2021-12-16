import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_danso/common/color.dart';
import 'package:project_danso/common/contant.dart';
import 'package:project_danso/common/icon.dart';
import 'package:project_danso/common/size.dart';
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
                padding: EdgeInsets.only(
                  bottom: MctSize.fifteen.getSize,
                ),
                child: InkWell(
                  onTap: () {
                    // Get.bottomSheet(bottomsheet());
                    bottomsheet(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: MctColor.buttonColorYellow.getMctColor),
                    height: 60.h,
                    child: Padding(
                      padding: EdgeInsets.all(MctSize.seventeen.getSize),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Entry $index',
                            style: TextStyle(
                                fontSize: MctSize.eighteen.getSize.sp,
                                color: MctColor.white.getMctColor,
                                fontFamily: NOTO_MEDIUM),
                          ),
                          Spacer(flex: 1),
                          Container(
                              width: 33,
                              height: 33,
                              child: SvgPicture.asset(
                                GRAPH_SVG,
                                width: 24.w,
                                height: 24.h,
                              ))
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
