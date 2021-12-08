import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/widgets.dart';

class MyPageLike extends StatelessWidget {
  final String songname;

  MyPageLike({Key? key, required this.songname}) : super(key: key);

  final LikeSongController likeSongController = Get.put(LikeSongController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tabbarAndAppBar(title: '관심곡', tabbar: null, enableTabBar: false),
      body: Obx(
        () => ListView.builder(
            padding: const EdgeInsets.all(basicPadding),
            itemCount: likeSongController.likeSongList.length,
            itemBuilder: (BuildContext context, int index) {
              var item = likeSongController.likeSongList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: basicPadding),
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
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: buttonColorOrang),
                    height: 60.h,
                    child: Padding(
                      padding: const EdgeInsets.all(svenPadddig),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${item.songTitle}',
                            style: TextStyle(
                                fontSize: textEightSize.sp,
                                color: white,
                                fontFamily: NOTO_MEDIUM),
                          ),
                          InkWell(
                            radius: 40.r,
                            onTap: () {
                              likeSongController.updateLikeSongList(
                                songId: item.songId,
                                songLike: item.songLike,
                              );
                            },
                            child: SvgPicture.asset(
                              BOOKMARK_SVG,
                              width: 20.w,
                              height: 20.h,
                              color:
                                  item.songLike == 'true' ? Colors.red : white,
                            ),
                          ),
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
