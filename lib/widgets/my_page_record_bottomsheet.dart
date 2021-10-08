import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

// Widget bottomsheet() {
//   return Container(
//     height: 526.h,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(20),
//         topRight: Radius.circular(20),
//       ),
//     ),
//     child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: ListView(
//           children: [
//             Text(
//               '곡이름',
//               style: TextStyle(
//                 fontSize: 22.sp,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 15.h),
//             ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: 10,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "날짜 2021.10.07 13:20",
//                           style: TextStyle(
//                               fontSize: 16.sp, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 10.h),
//                         Container(
//                           width: 330.w,
//                           height: 35.h,
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                               colors: [
//                                 Color(0xffECECEC),
//                                 Color(0xffD6D6D6),
//                                 Color(0xff9D9D9D),
//                               ],
//                             ),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                                 top: 4, bottom: 4, right: 8),
//                             child: Text(
//                               "점수",
//                               style: TextStyle(
//                                 fontSize: 18.sp,
//                               ),
//                               textAlign: TextAlign.right,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 21),
//                       ],
//                     ),
//                   );
//                 })
//           ],
//         )),
//   );
// }

void bottomsheet(BuildContext context) async {
  final result = await showSlidingBottomSheet(context, builder: (context) {
    return SlidingSheetDialog(
      elevation: 8,
      cornerRadius: 16,
      snapSpec: const SnapSpec(
        snap: true,
        snappings: [
          0.4,
          0.8,
          1.0,
        ],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      builder: (context, state) {
        return Container(
            height: 600.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "곡 이름",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  Container(
                    height: 500.h,
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "날짜",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              SizedBox(height: 10.h),
                              Container(
                                width: 330.w,
                                height: 35.h,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xffECECEC),
                                      Color(0xffD6D6D6),
                                      Color(0xff9D9D9D),
                                    ],
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "점수",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ),
                              ),
                              SizedBox(height: 25.h),
                            ],
                          );
                        }),
                  )
                ],
              ),
            ));
      },
    );
  });

  print(result); // This is the result.
}
