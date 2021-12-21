import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
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
            padding: EdgeInsets.all(MctSize.fifteen.getSize),
            itemCount: likeSongController.likeSongList.length,
            itemBuilder: (BuildContext context, int index) {
              var item = likeSongController.likeSongList[index];
              return Padding(
                padding: EdgeInsets.only(bottom: MctSize.fifteen.getSize),
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
                        color: MctColor.buttonColorOrange.getMctColor),
                    height: 60.h,
                    child: Padding(
                      padding: EdgeInsets.all(MctSize.seventeen.getSize),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${item.songTitle}',
                            style: TextStyle(
                                fontSize: MctSize.eighteen.getSize.sp,
                                color: MctColor.white.getMctColor,
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
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 5, bottom: 5, top: 5),
                              child: SvgPicture.asset(
                                BOOKMARK_SVG,
                                width: 40.w,
                                height: 40.w,
                                color: item.songLike == 'true'
                                    ? Colors.red
                                    : MctColor.white.getMctColor,
                              ),
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
