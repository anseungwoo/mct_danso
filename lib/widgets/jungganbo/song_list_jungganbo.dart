import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:danso_function/danso_function.dart';

Widget fourByEightJung(double width, double height, int next) {
  var testJungGanBo = JungGanBo('도라지타령', '세마치장단',
      't|m|h|o#mh|tm|h|o#mh|tm|h|o#mh|tm|h|o#mh|tm|h|o#t|m|h|o#J|^|J|^#J|^|J|J#mh|tt|tt|h#tt|J|tt|h#t|tt|tt|h#tt|J|tt|h#t|tt|tt|h#tt|J|tt|h#mh|tt|tt|h#tt|J|tt|h#mh|tm|h|o#mh|tt|tt|th#th|mh|t|^#o|o|o|o#');
  var text = '1';

  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 24 + next; i < 32 + next; i++)
            Row(
              children: [
                bigfourbyEight(width, height, testJungGanBo, i),
                smallfourbyEight(20, height),
              ],
            ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 16 + next; i < 24 + next; i++)
            Row(
              children: [
                bigfourbyEight(width, height, testJungGanBo, i),
                smallfourbyEight(20, height),
              ],
            ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 8 + next; i < 16 + next; i++)
            Row(
              children: [
                bigfourbyEight(width, height, testJungGanBo, i),
                smallfourbyEight(20, height),
              ],
            ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0 + next; i < 8 + next; i++)
            Row(
              children: [
                bigfourbyEight(width, height, testJungGanBo, i),
                smallfourbyEight(20, height),
              ],
            ),
        ],
      ),
    ],
  );
}

Widget fourBySixJung(double width, double height) {
  JungGanBo testJungGanBo = new JungGanBo("도라지타령", "세마치장단",
      "t|m|h|o#mh|tm|h|o#mh|tm|h|o#mh|tm|h|o#mh|tm|h|o#t|m|h|o#J|^|J|^#J|^|J|J#mh|tt|tt|h#tt|J|tt|h#t|tt|tt|h#tt|J|tt|h#t|tt|tt|h#tt|J|tt|h#mh|tt|tt|h#tt|J|tt|h#mh|tm|h|o#mh|tt|tt|th#th|mh|t|^#o|o|o|o#");
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 18; i < 24; i++)
            Row(
              children: [
                bigfourbysix(width, height, testJungGanBo, i),
                smallfourbysix(20, height),
              ],
            ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 12; i < 18; i++)
            Row(
              children: [
                bigfourbysix(width, height, testJungGanBo, i),
                smallfourbysix(20, height),
              ],
            ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 6; i < 12; i++)
            Row(
              children: [
                bigfourbysix(width, height, testJungGanBo, i),
                smallfourbysix(20, height),
              ],
            ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < 6; i++)
            Row(
              children: [
                bigfourbysix(width, height, testJungGanBo, i),
                smallfourbysix(20, height),
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

Container bigfourbyEight(
    double width, double height, JungGanBo testJungGanBo, int i) {
  return Container(
    width: width.w,
    height: height.h,
    decoration:
        BoxDecoration(color: white, border: Border.all(color: textBlack)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        testJungGanBo.sheet[i].yulmyeongs.length == 1
            ? Center(
                child: Text(
                testJungGanBo.sheet[i].yulmyeongs[0].toChineseCharacter(),
                style: TextStyle(fontSize: 14),
              ))
            : testJungGanBo.sheet[i].yulmyeongs.length == 2
                ? Column(
                    children: [
                      Center(
                          child: Text(
                        testJungGanBo.sheet[i].yulmyeongs[0]
                            .toChineseCharacter(),
                        style: TextStyle(fontSize: 14),
                      )),
                      Center(
                          child: Text(
                        testJungGanBo.sheet[i].yulmyeongs[1]
                            .toChineseCharacter(),
                        style: TextStyle(fontSize: 14),
                      ))
                    ],
                  )
                : testJungGanBo.sheet[i].yulmyeongs.length == 3
                    ? Column(
                        children: [
                          Center(
                              child: Text(
                            testJungGanBo.sheet[i].yulmyeongs[0]
                                .toChineseCharacter(),
                            style: TextStyle(fontSize: 14),
                          )),
                          Center(
                              child: Text(
                            testJungGanBo.sheet[i].yulmyeongs[1]
                                .toChineseCharacter(),
                            style: TextStyle(fontSize: 14),
                          )),
                          Center(
                              child: Text(
                            testJungGanBo.sheet[i].yulmyeongs[2]
                                .toChineseCharacter(),
                            style: TextStyle(fontSize: 14),
                          ))
                        ],
                      )
                    : Container(),
      ],
    ),
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

Container bigfourbysix(
    double width, double height, JungGanBo testJungGanBo, int i) {
  return Container(
    width: width.w,
    height: height.h,
    decoration:
        BoxDecoration(color: white, border: Border.all(color: textBlack)),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      testJungGanBo.sheet[i].yulmyeongs.length == 1
          ? Center(
              child: Text(
              testJungGanBo.sheet[i].yulmyeongs[0].toChineseCharacter(),
              style: TextStyle(fontSize: 14),
            ))
          : testJungGanBo.sheet[i].yulmyeongs.length == 2
              ? Column(
                  children: [
                    Center(
                        child: Text(
                      testJungGanBo.sheet[i].yulmyeongs[0].toChineseCharacter(),
                      style: TextStyle(fontSize: 14),
                    )),
                    Center(
                        child: Text(
                      testJungGanBo.sheet[i].yulmyeongs[1].toChineseCharacter(),
                      style: TextStyle(fontSize: 14),
                    ))
                  ],
                )
              : testJungGanBo.sheet[i].yulmyeongs.length == 3
                  ? Column(
                      children: [
                        Center(
                            child: Text(
                          testJungGanBo.sheet[i].yulmyeongs[0]
                              .toChineseCharacter(),
                          style: TextStyle(fontSize: 14),
                        )),
                        Center(
                            child: Text(
                          testJungGanBo.sheet[i].yulmyeongs[1]
                              .toChineseCharacter(),
                          style: TextStyle(fontSize: 14),
                        )),
                        Center(
                            child: Text(
                          testJungGanBo.sheet[i].yulmyeongs[2]
                              .toChineseCharacter(),
                          style: TextStyle(fontSize: 14),
                        ))
                      ],
                    )
                  : Container(),
    ]),
  );
}
