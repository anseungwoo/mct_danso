import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/common.dart';
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
              padding: EdgeInsets.all(MctSize.fifteen.getSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$songTitle',
                    style: TextStyle(
                        fontSize: MctSize.twentyThree.getSize.sp,
                        color: MctColor.black.getMctColor,
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
                                    fontSize: MctSize.eighteen.getSize.sp,
                                    color: MctColor.black.getMctColor,
                                    decoration: TextDecoration.none),
                              ),
                              SizedBox(height: 10.h),
                              Container(
                                width: (ScreenUtil().screenWidth / 100) *
                                    (item.chalScore)!.toInt(),
                                height: 35.h,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      MctColor.gradationColorYellow.getMctColor,
                                      MctColor.lightYellow.getMctColor,
                                    ],
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    '${item.chalScore}점',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: MctSize.fifteen.getSize.sp,
                                        color: MctColor.black.getMctColor,
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
