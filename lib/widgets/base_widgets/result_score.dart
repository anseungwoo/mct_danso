import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/widgets.dart';

class ResultScore extends StatefulWidget {
  final int scrore;
  final songTitle;
  final songId;

  ResultScore(
      {Key? key,
      required this.scrore,
      required this.songTitle,
      required this.songId})
      : super(key: key);

  @override
  State<ResultScore> createState() => _ResultScoreState();
}

class _ResultScoreState extends State<ResultScore> {
  ReslutScoreController reslutScoreController =
      Get.put(ReslutScoreController());
  @override
  void initState() {
    reslutScoreController.score = widget.scrore;
    reslutScoreController.resultText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReslutScoreController>(
        init: reslutScoreController,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: background,
              automaticallyImplyLeading: false,
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: textBlack,
                    ))
              ],
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(basicPadding),
              child: Container(
                width: 70.w,
                height: 70.h,
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: buttonColorOrang,
                  onPressed: () {
                    Get.off(SongGraph(
                      songId: widget.songId,
                      songTitle: widget.songTitle,
                    ));
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          GRAPH_SVG,
                          height: 24.h,
                        ),
                        Text(
                          '그래프',
                          style: TextStyle(fontSize: textBasicSize.sp),
                        )
                      ]),
                ),
              ),
            ),
            body: Column(
              children: [
                SizedBox(height: 50.h),
                Center(
                    child: Container(
                        width: 250.w,
                        height: 250.h,
                        child: SvgPicture.asset(controller.iamge))),
                Text(
                  '${widget.scrore}',
                  style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: NOTO_MEDIUM),
                ),
                SizedBox(height: basicPadding),
                Text(
                  controller.comment,
                  style: TextStyle(
                      fontSize: textEightSize.sp, fontFamily: NOTO_REGULAR),
                ),
              ],
            ),
          );
        });
  }
}
