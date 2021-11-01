import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget jungganboFromLevel(List level) {
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
          jungContainer(level, 36),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 37),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 38),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 39),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 40),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 41),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 42),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 43),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 44),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 45),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 46),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 47),
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
          jungContainer(level, 24),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 25),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 26),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 27),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 28),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 29),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 30),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 31),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 32),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 33),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 34),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 35),
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
          jungContainer(level, 12),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 13),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 14),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 15),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 16),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 17),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 18),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 19),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 20),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 21),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 22),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 23),
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
          jungContainer(level, 0),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 1),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 2),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 3),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 4),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 5),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 6),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 7),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 8),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 9),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 10),
          blackContainer(),
        ],
      ),
      Row(
        children: [
          jungContainer(level, 11),
          blackContainer(),
        ],
      ),
    ],
  );
}

Container blackContainer() {
  return Container(
    width: 20.w,
    height: jungHeight.h,
    decoration: BoxDecoration(
      border: Border.all(color: textBlack),
    ),
  );
}

Container jungContainer(List level, int count) {
  return Container(
    width: jungWidth.w,
    height: jungHeight.h,
    decoration: BoxDecoration(border: Border.all(color: textBlack)),
    child: Center(
        child: Text(
      '${level[count]}',
      style: TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
    )),
  );
}
