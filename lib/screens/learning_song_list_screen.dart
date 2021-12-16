import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/controllers/tear_controller.dart';
import 'package:project_danso/widgets/widgets.dart';

class LearningSongListScreen extends StatefulWidget {
  LearningSongListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LearningSongListScreen> createState() => _LearningSongListScreenState();
}

class _LearningSongListScreenState extends State<LearningSongListScreen> {
  final LearningSongAndLevelController learningSongLevelController =
      Get.put(LearningSongAndLevelController());

  final TearController _tearController = Get.put(TearController());

  @override
  void dispose() {
    super.dispose();
    _tearController.getTearInfo();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LearningSongAndLevelController>(
        init: learningSongLevelController,
        builder: (controller) {
          return Scaffold(
            appBar: tabbarAndAppBar(
                title: '연주곡 익히기', tabbar: null, enableTabBar: false),
            body: Column(
              children: [
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    height: 70.h,
                    // width: 330.w,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.previousLevel();
                          },
                          child: SvgPicture.asset(
                            LEFT_SVG,
                            width: 20.w,
                            height: 30.h,
                          ),
                        ),
                        Spacer(flex: 1),
                        SvgPicture.asset(
                          STEP_SVG[controller.currentLevel],
                          width: 90.w,
                          height: 80.h,
                        ),
                        Spacer(flex: 1),
                        InkWell(
                          onTap: () {
                            controller.nextLevel();
                          },
                          child: SvgPicture.asset(
                            RIGHT_SVG,
                            width: 20.w,
                            height: 30.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (int i = 0;
                            i <
                                controller
                                    .yulmyeongHangeul[controller.currentLevel]
                                    .length;
                            i++)
                          Container(
                            width: 33.w,
                            height: 33.h,
                            decoration: BoxDecoration(
                                color: white,
                                border:
                                    Border.all(color: textBlack, width: 0.5)),
                            child: Center(
                              child: Text(
                                  '${controller.yulmyeongHangeul[controller.currentLevel][i].toHangeul()}',
                                  style: TextStyle(
                                      fontSize: textEightSize.sp,
                                      fontFamily: NOTO_REGULAR)),
                            ),
                          )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (var i = 0;
                            i <
                                controller
                                    .yulmyeongHanja[controller.currentLevel]
                                    .length;
                            i++)
                          Container(
                            width: 33.w,
                            height: 33.h,
                            decoration: BoxDecoration(
                                color: white,
                                border:
                                    Border.all(color: textBlack, width: 0.5)),
                            child: Center(
                              child: Text(
                                  '${controller.yulmyeongHanja[controller.currentLevel][i].toChineseCharacter()}',
                                  style: TextStyle(
                                      fontSize: textEightSize.sp,
                                      fontFamily: NOTO_REGULAR)),
                            ),
                          )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(basicPadding),
                    child: ListView.builder(
                        itemCount: controller.songList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var item = controller.songList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: InkWell(
                              onTap: () {
                                Get.to(
                                  SongPlayAndTest(
                                    appbarTitle: item.songTitle,
                                    jangdan: item.songJangdan,
                                    sheetData: item.songSheet,
                                    sheetVertical: item.songSheetVertical,
                                    sheetHorizontal: item.songSheetHorizontal,
                                    songId: item.songId,
                                  ),
                                );
                                // Get.to(SheetTestScreen(
                                //   sheetData: item.songSheet,
                                //   jangdan: item.songJangdan,
                                //   songTitle: item.songTitle,
                                // ));
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: buttonColorYellow,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  height: 57.h,
                                  // width: 330.w,
                                  child: Padding(
                                    padding: const EdgeInsets.all(basicPadding),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          COUNT_LIST_SVG[index],
                                          width: 23.w,
                                          height: 23.h,
                                        ),
                                        SizedBox(width: 15.w),
                                        Text('${item.songTitle}',
                                            style: TextStyle(
                                                fontSize: textBasicSize.sp,
                                                color: white,
                                                fontFamily: NOTO_MEDIUM)),
                                        Spacer(flex: 1),
                                        InkWell(
                                          radius: 40.r,
                                          onTap: () {
                                            controller.updateLikeSongList(
                                              songId: item.songId,
                                              songLike: item.songLike,
                                              exerNum: controller.currentLevel,
                                            );
                                          },
                                          child: SvgPicture.asset(
                                            BOOKMARK_SVG,
                                            width: 20.w,
                                            height: 20.h,
                                            color: item.songLike == 'true'
                                                ? Colors.red
                                                : white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
