// import 'package:danso_function/model/jung-gan-bo_model/JungGanBo.dart';
// import 'package:flutter/material.dart';
// import 'package:project_danso/common/const.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// Widget jungganboFromFlash(
//     int heightNumber, controller, JungGanBo testJungGanBo) {
//   double height = heightNumber == 12
//       ? jungHeight
//       : heightNumber == 8
//           ? jungEightHeight
//           : jungSixHeight;
//   int j = 0;
//   return Row(
//     children: [
//       for (var c = 1; c < 5; c++)
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             for (var i = heightNumber * c; i < heightNumber * (c + 1); i++)
//               Row(
//                 children: [
//                   testJungGanBo.sheet[i].yulmyeongs.length == 1
//                       ? jungFlashContainer(height, controller.flashcount, i, j,
//                           heightNumber, testJungGanBo)
//                       : testJungGanBo.sheet[i].yulmyeongs.length == 2
//                           ? Column(
//                               children: [
//                                 for (var j = 0; j < 2; j++)
//                                   jungFlashContainer(
//                                       height / 2,
//                                       controller.flashcount,
//                                       i,
//                                       j,
//                                       heightNumber,
//                                       testJungGanBo)
//                               ],
//                             )
//                           : testJungGanBo.sheet[i].yulmyeongs.length == 3
//                               ? Column(
//                                   children: [
//                                     for (var j = 0; j < 3; j++)
//                                       jungFlashContainer(
//                                           height / 3,
//                                           controller.flashcount,
//                                           i,
//                                           j,
//                                           heightNumber,
//                                           testJungGanBo)
//                                   ],
//                                 )
//                               : Container(),
//                   blankContainer(height),
//                 ],
//               ),
//           ],
//         ),
//     ],
//   );
// }

// Container blankContainer(double height) {
//   return Container(
//     width: 20.w,
//     height: height.h,
//     decoration:
//         BoxDecoration(color: white, border: Border.all(color: textBlack)),
//   );
// }

// Container jungFlashContainer(double height, int a, int i, int j,
//     int heightNumber, JungGanBo testJungGanBo) {
//   return Container(
//     width: jungWidth.w,
//     height: height.h,
//     decoration:
//         BoxDecoration(color: white, border: Border.all(color: textBlack)),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Center(
//             child: Text(
//           testJungGanBo.sheet[i].yulmyeongs[j].toChineseCharacter(),
//           style: TextStyle(fontSize: heightNumber == 12 ? 25.sp : 14.sp),
//         )),
//       ],
//     ),
//   );
// }
