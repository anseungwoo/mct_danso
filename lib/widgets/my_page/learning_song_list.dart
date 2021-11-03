import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/widgets.dart';

import '../sheet_test.dart';

class LearningSongList extends StatelessWidget {
  LearningSongList({
    Key key,
  }) : super(key: key);

  final LearningSongAndLevelController learningSongLevelController =
      Get.put(LearningSongAndLevelController());

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
                Padding(
                  padding: const EdgeInsets.all(basicPadding),
                  child: Container(
                    height: 70.h,
                    // width: 330.w,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.previousLevel();
                          },
                          icon: Icon(Icons.keyboard_arrow_left),
                          iconSize: 30,
                        ),
                        Spacer(flex: 1),
                        CircleAvatar(
                          radius: 35,
                          child: Center(
                              child:
                                  Text('${controller.currentLevel} 아이콘 이미지')),
                        ),
                        Spacer(flex: 1),
                        IconButton(
                            onPressed: () {
                              controller.nextLevel();
                            },
                            icon: Icon(Icons.keyboard_arrow_right)),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: lightGray,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  height: 90.h,
                  // width: 330.w,
                  child: Center(
                      child: Text(
                    '사용할 율명 표시',
                    style: TextStyle(
                        color: textDarkBlack, fontWeight: FontWeight.bold),
                  )),
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
                                    color: mediumGray,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  height: 57.h,
                                  // width: 330.w,
                                  child: Padding(
                                    padding: const EdgeInsets.all(basicPadding),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('$index. ${item.songTitle}',
                                            style: TextStyle(color: white)),
                                        IconButton(
                                          onPressed: () {
                                            controller.updateLikeSongList(
                                              songId: item.songId,
                                              songLike: item.songLike,
                                              exerNum: controller.currentLevel,
                                            );
                                          },
                                          icon: Icon(Icons.favorite),
                                          color: item.songLike == 'true'
                                              ? Colors.red
                                              : white,
                                        )
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
