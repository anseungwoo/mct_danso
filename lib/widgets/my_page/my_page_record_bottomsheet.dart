import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/models/models.dart';
import 'package:project_danso/utils/date_format.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

void bottomsheet(
    BuildContext context, var songTitle, List<MyHistoryModel> graphItem) async {
  final result = await showSlidingBottomSheet(context, builder: (context) {
    var slidingSheetDialog = SlidingSheetDialog(
      elevation: 8,
      cornerRadius: 16,
      snapSpec: const SnapSpec(
        snap: true,
        snappings: [0.4, 0.8, 1.0],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      builder: (context, state) {
        return Container(
            height: 500.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(basicPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$songTitle',
                    style: TextStyle(
                        fontSize: textSingleSize.sp,
                        color: textBlack,
                        decoration: TextDecoration.none),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: graphItem.length,
                        itemBuilder: (BuildContext context, int index) {
                          var item = graphItem[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                convertDateFormat(item.chalTime),
                                style: TextStyle(
                                    fontSize: textEightSize.sp,
                                    color: textBlack,
                                    decoration: TextDecoration.none),
                              ),
                              SizedBox(height: 10.h),
                              Container(
                                width: ScreenUtil().screenWidth * 100 / 100,
                                height: 35.h,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      graColorYellow,
                                      logoColor,
                                    ],
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    '${item.chalScore}',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: textEightSize.sp,
                                        color: textBlack,
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                              ),
                              SizedBox(height: 25.h),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ));
      },
    );
    return slidingSheetDialog;
  });

  print(result); // This is the result.
}
