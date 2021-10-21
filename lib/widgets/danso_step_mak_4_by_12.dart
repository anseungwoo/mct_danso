import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget stepJonGanbo(List step) {
  return Row(
    children: [
      left(step),
      centerLeft(step),
      centerRight(step),
      right(step),
    ],
  );
}

Column right(List step) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Row(
        children: [
          jonContainer(step, 36),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 37),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 38),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 39),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 40),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 41),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 42),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 43),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 44),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 45),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 46),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 47),
          blackContainer(),
        ],
      ),
    ],
  );
}

Column centerRight(List step) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Row(
        children: [
          jonContainer(step, 24),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 25),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 26),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 27),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 28),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 29),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 30),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 31),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 32),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 33),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 34),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 35),
          blackContainer(),
        ],
      ),
    ],
  );
}

Column centerLeft(List step) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Row(
        children: [
          jonContainer(step, 12),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 13),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 14),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 15),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 16),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 17),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 18),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 19),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 20),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 21),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 22),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 23),
          blackContainer(),
        ],
      ),
    ],
  );
}

Column left(List step) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Row(
        children: [
          jonContainer(step, 0),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 1),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 2),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 3),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 4),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 5),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 6),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 7),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 8),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 9),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 10),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(step, 11),
          blackContainer(),
        ],
      ),
    ],
  );
}

Container blackContainer() {
  return Container(
    width: 20.w,
    height: jonHeight.h,
    decoration: BoxDecoration(
      border: Border.all(color: textBlack),
    ),
  );
}

Container jonContainer(List step, int count) {
  return Container(
    width: jonWidth.w,
    height: jonHeight.h,
    decoration: BoxDecoration(border: Border.all(color: textBlack)),
    child: Center(
        child: Text(
      "${step[count]}",
      style: TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
    )),
  );
}
