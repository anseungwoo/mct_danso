import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget levelJonGanbo(List level) {
  return Row(
    children: [
      left(level),
      centerLeft(level),
      centerRight(level),
      right(level),
    ],
  );
}

Column right(List level) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Row(
        children: [
          jonContainer(level, 36),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 37),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 38),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 39),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 40),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 41),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 42),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 43),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 44),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 45),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 46),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 47),
          blackContainer(),
        ],
      ),
    ],
  );
}

Column centerRight(List level) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Row(
        children: [
          jonContainer(level, 24),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 25),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 26),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 27),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 28),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 29),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 30),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 31),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 32),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 33),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 34),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 35),
          blackContainer(),
        ],
      ),
    ],
  );
}

Column centerLeft(List level) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Row(
        children: [
          jonContainer(level, 12),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 13),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 14),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 15),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 16),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 17),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 18),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 19),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 20),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 21),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 22),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 23),
          blackContainer(),
        ],
      ),
    ],
  );
}

Column left(List level) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Row(
        children: [
          jonContainer(level, 0),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 1),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 2),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 3),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 4),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 5),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 6),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 7),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 8),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 9),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 10),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jonContainer(level, 11),
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

Container jonContainer(List level, int count) {
  return Container(
    width: jonWidth.w,
    height: jonHeight.h,
    decoration: BoxDecoration(border: Border.all(color: textBlack)),
    child: Center(
        child: Text(
      "${level[count]}",
      style: TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
    )),
  );
}
