import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/widgets/widgets.dart';

class DansoLevel extends StatelessWidget {
  const DansoLevel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: tabbarAndAppBar(
            title: '연주곡 익히기', tabbar: null, enableTabBar: false),
        body: GetBuilder<DansoSoundLearningController>(
            init: DansoSoundLearningController(),
            builder: (controller) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(basicPadding),
                    child: Container(
                      height: 70.h,
                      width: 330.w,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.previouspage();
                              Get.to(DansoLevel());
                            },
                            icon: Icon(Icons.keyboard_arrow_left),
                            iconSize: 30,
                          ),
                          Spacer(flex: 1),
                          CircleAvatar(
                            radius: 35,
                            child: Center(
                                child: Text("${controller.test} 아이콘 이미지")),
                          ),
                          Spacer(flex: 1),
                          IconButton(
                              onPressed: () {
                                controller.nextpage();
                                Get.to(DansoLevel());
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
                    width: 330.w,
                    child: Center(
                        child: Text(
                      "사용할 율명 표시",
                      style: TextStyle(
                          color: textDarkBlack, fontWeight: FontWeight.bold),
                    )),
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(basicPadding),
                      child: ListView.builder(
                          itemCount: controller.list1[controller.test].length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: InkWell(
                                onTap: () {
                                  Get.to(SongTitle());
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: mediumGray,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              5.0) //         <--- border radius here
                                          ),
                                    ),
                                    height: 57.h,
                                    width: 330.w,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.all(basicPadding),
                                      child: Row(
                                        children: [
                                          Text("${index}. 곡리스트",
                                              style: TextStyle(color: white)),
                                          Spacer(flex: 1),
                                          IconButton(
                                            padding: EdgeInsets.all(1),
                                            onPressed: () {
                                              Get.to(Congrats());
                                            },
                                            icon: Icon(Icons.favorite),
                                            color: white,
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
              );
            }));
  }
}
