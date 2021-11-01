import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:danso_function/danso_function.dart';

Widget fourByEightJung(double width, double height) {
  var text = '1';
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 2),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 3),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbyEight(width, height, text, 1),
              smallfourbyEight(20, height),
            ],
          ),
        ],
      ),
    ],
  );
}

Container smallfourbyEight(double width, double height) {
  return Container(
    width: width.w,
    height: height.h,
    decoration:
        BoxDecoration(color: white, border: Border.all(color: textBlack)),
  );
}

Container bigfourbyEight(double width, double height, String text, int line) {
  return Container(
    width: width.w,
    height: height.h,
    decoration:
        BoxDecoration(color: white, border: Border.all(color: textBlack)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        line == 1
            ? Center(
                child: Text(
                  '${YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin).toChineseCharacter()}',
                  style: TextStyle(fontSize: 14),
                ),
              )
            : line == 2
                ? Column(
                    children: [
                      Center(
                        child: Text(
                          '淋',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Center(
                        child: Text(
                          '淋',
                          style: TextStyle(fontSize: 14),
                        ),
                      )
                    ],
                  )
                : line == 3
                    ? Column(
                        children: [
                          Center(
                            child: Text(
                              '淋',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Center(
                            child: Text(
                              '淋',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Center(
                            child: Text(
                              '淋',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      )
                    : Container(),
      ],
    ),
  );
}

Widget fourBySixJung(double width, double height) {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 2),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 3),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
          Row(
            children: [
              bigfourbysix(width, height, 1),
              smallfourbysix(20, height),
            ],
          ),
        ],
      ),
    ],
  );
}

Container smallfourbysix(double width, double height) {
  return Container(
    width: width.w,
    height: height.h,
    decoration:
        BoxDecoration(color: white, border: Border.all(color: textBlack)),
  );
}

Container bigfourbysix(double width, double height, int line) {
  return Container(
    width: width.w,
    height: height.h,
    decoration:
        BoxDecoration(color: white, border: Border.all(color: textBlack)),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      line == 1
          ? Center(
              child: Text(
              YulmyeongNote(Yulmyeong.hwang, ScaleStatus.high)
                  .toChineseCharacter(),
              style: TextStyle(fontSize: 19.sp),
            ))
          : line == 2
              ? Column(
                  children: [
                    Center(
                        child: Text(
                      YulmyeongNote(Yulmyeong.joong, ScaleStatus.high)
                          .toChineseCharacter(),
                      style: TextStyle(fontSize: 19.sp),
                    )),
                    Center(
                        child: Text(
                      YulmyeongNote(Yulmyeong.tae, ScaleStatus.high)
                          .toChineseCharacter(),
                      style: TextStyle(fontSize: 19.sp),
                    ))
                  ],
                )
              : line == 3
                  ? Column(
                      children: [
                        Center(
                            child: Text(
                          YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin)
                              .toChineseCharacter(),
                          style: TextStyle(fontSize: 19.sp),
                        )),
                        Center(
                            child: Text(
                          YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin)
                              .toChineseCharacter(),
                          style: TextStyle(fontSize: 19.sp),
                        )),
                        Center(
                            child: Text(
                          YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin)
                              .toChineseCharacter(),
                          style: TextStyle(fontSize: 19.sp),
                        ))
                      ],
                    )
                  : Container(),
    ]),
  );
}
// Widget fourByFourJung() {
//   return Row(
//     children: [
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               bigfourbyfour(),
//               smallfourbyfour(),
//             ],
//           ),
//           Row(
//             children: [
//               bigfourbyfour(),
//               smallfourbyfour(),
//             ],
//           ),
//           Row(
//             children: [
//               bigfourbyfour(),
//               smallfourbyfour(),
//             ],
//           ),
//           Row(
//             children: [
//               bigfourbyfour(),
//               smallfourbyfour(),
//             ],
//           ),
//         ],
//       ),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               bigfourbyfour(),
//               smallfourbyfour(),
//             ],
//           ),
//           Row(
//             children: [
//               bigfourbyfour(),
//               smallfourbyfour(),
//             ],
//           ),
//           Row(
//             children: [
//               bigfourbyfour(),
//               smallfourbyfour(),
//             ],
//           ),
//           Row(
//             children: [
//               bigfourbyfour(),
//               smallfourbyfour(),
//             ],
//           ),
//         ],
//       ),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               bigfourbyfour(),
//               smallfourbyfour(),
//             ],
//           ),
//           Row(
//             children: [
//               bigfourbyfour(),
//               smallfourbyfour(),
//             ],
//           ),
//           Row(
//             children: [
//               bigfourbyfour(),
//               smallfourbyfour(),
//             ],
//           ),
//           Row(
//             children: [
//               bigfourbyfour(),
//               smallfourbyfour(),
//             ],
//           ),
//         ],
//       ),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               bigfourbyfour(),
//               smallfourbyfour(),
//             ],
//           ),
//           Row(
//             children: [
//               bigfourbyfour(),
//               smallfourbyfour(),
//             ],
//           ),
//           Row(
//             children: [
//               bigfourbyfour(),
//               smallfourbyfour(),
//             ],
//           ),
//           Row(
//             children: [
//               bigfourbyfour(),
//               smallfourbyfour(),
//             ],
//           ),
//         ],
//       ),
//     ],
//   );
// }

// Container smallfourbyfour() {
//   return Container(
//     width: 20.w,
//     height: jungFourHeight.h,
//     decoration:
//         BoxDecoration(color: white, border: Border.all(color: textBlack)),
//   );
// }

// Container bigfourbyfour() {
//   return Container(
//     width: jungFourWidth.w,
//     height: jungFourHeight.h,
//     decoration:
//         BoxDecoration(color: white, border: Border.all(color: textBlack)),
//   );
// }
