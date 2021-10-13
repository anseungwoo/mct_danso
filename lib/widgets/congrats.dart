import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/widgets.dart';

class Congrats extends StatelessWidget {
  const Congrats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(basicPadding),
        child: Container(
          width: 70.w,
          height: 70.h,
          child: FloatingActionButton(
            onPressed: () {
              Get.to(SongGraph());
            },
            child: Text("그래프아이콘"),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.all(basicPadding),
            child: Container(
                color: lightGray,
                width: 120.w,
                height: 120.h,
                child: Icon(Icons.fmd_good)),
          )),
          Text(
            "너무 잘했어요!!!!!!!!!!!!!!!!!!!!!!!!!!",
            style: TextStyle(
                fontSize: textSingleSize, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: basicPadding),
          Text(
            "흠이 없는 실력 이군요",
            style: TextStyle(fontSize: textStyleSize),
          ),
        ],
      ),
    );
  }
}
