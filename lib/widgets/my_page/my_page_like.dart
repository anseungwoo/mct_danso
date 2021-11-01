import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';

class MyPageLike extends StatelessWidget {
  final String songname;

  MyPageLike({Key key, @required this.songname}) : super(key: key);

  final LikeSongController likeSongController = Get.put(LikeSongController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
          padding: const EdgeInsets.all(basicPadding),
          itemCount: likeSongController.likeSongList.length,
          itemBuilder: (BuildContext context, int index) {
            var item = likeSongController.likeSongList[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: basicPadding),
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: mediumGray),
                  height: 60.h,
                  child: Padding(
                    padding: const EdgeInsets.all(stylePadddig),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${item.songTitle}',
                          style: TextStyle(
                              fontSize: textStyleSize.sp, color: white),
                        ),
                        Spacer(flex: 1),
                        IconButton(
                          padding: EdgeInsets.only(bottom: 22),
                          icon: Icon(Icons.favorite),
                          color: item.songLike == 'true' ? Colors.red : white,
                          onPressed: () {
                            likeSongController.updateLikeSongList(
                              songId: item.songId,
                              songLike: item.songLike,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
