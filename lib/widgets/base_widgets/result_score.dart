import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/color.dart';
import 'package:project_danso/common/contant.dart';
import 'package:project_danso/common/icon.dart';
import 'package:project_danso/common/size.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/my_page/song_graph.dart';
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
              backgroundColor: MctColor.mainBackGround.getMctColor,
              automaticallyImplyLeading: false,
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: MctColor.black.getMctColor,
                    ))
              ],
            ),
            floatingActionButton: Padding(
              padding: EdgeInsets.all(MctSize.fifteen.getSize),
              child: Container(
                width: 70.w,
                height: 70.h,
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: MctColor.buttonColorOrange.getMctColor,
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
                          style:
                              TextStyle(fontSize: MctSize.fourteen.getSize.sp),
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
                SizedBox(height: MctSize.fifteen.getSize),
                Text(
                  controller.comment,
                  style: TextStyle(
                      fontSize: MctSize.eighteen.getSize.sp,
                      fontFamily: NOTO_REGULAR),
                ),
              ],
            ),
          );
        });
  }
}
