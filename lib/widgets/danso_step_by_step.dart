import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/widgets.dart';

class DansoStepByStep extends StatelessWidget {
  List step;
  String level;
  DansoStepByStep({Key key, this.step, this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Text(
                "${level}단계 연습곡",
                style: TextStyle(fontSize: textSingleSize, fontWeight: bold),
              ),
            ),
            vertcal(step),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 30.h,
                    width: 105.w,
                    child:
                        ElevatedButton(onPressed: () {}, child: Text("시작하기"))),
                Spacer(
                  flex: 1,
                ),
                Container(
                    height: 30.h,
                    width: 105.w,
                    child:
                        ElevatedButton(onPressed: () {}, child: Text("종료하기"))),
                Spacer(
                  flex: 1,
                ),
                Container(
                    height: 30.h,
                    width: 105.w,
                    child:
                        ElevatedButton(onPressed: () {}, child: Text("1배속"))),
              ],
            ),
          ],
        ));
  }
}
