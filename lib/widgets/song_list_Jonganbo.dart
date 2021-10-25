import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget fourBySixJon() {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
        ],
      ),
    ],
  );
}

Widget fourByFourJon() {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              bigfourbyfour(),
              smallfourbyfour(),
            ],
          ),
          Row(
            children: [
              bigfourbyfour(),
              smallfourbyfour(),
            ],
          ),
          Row(
            children: [
              bigfourbyfour(),
              smallfourbyfour(),
            ],
          ),
          Row(
            children: [
              bigfourbyfour(),
              smallfourbyfour(),
            ],
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              bigfourbyfour(),
              smallfourbyfour(),
            ],
          ),
          Row(
            children: [
              bigfourbyfour(),
              smallfourbyfour(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbyfour(),
              smallfourbyfour(),
            ],
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              bigfourbyfour(),
              smallfourbyfour(),
            ],
          ),
          Row(
            children: [
              bigfourbyfour(),
              smallfourbyfour(),
            ],
          ),
          Row(
            children: [
              bigfourbysix(),
              smallfourbysix(),
            ],
          ),
          Row(
            children: [
              bigfourbyfour(),
              smallfourbyfour(),
            ],
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              bigfourbyfour(),
              smallfourbyfour(),
            ],
          ),
          Row(
            children: [
              bigfourbyfour(),
              smallfourbyfour(),
            ],
          ),
          Row(
            children: [
              bigfourbyfour(),
              smallfourbyfour(),
            ],
          ),
          Row(
            children: [
              bigfourbyfour(),
              smallfourbyfour(),
            ],
          ),
        ],
      ),
    ],
  );
}

Container smallfourbysix() {
  return Container(
    width: 20.w,
    height: jonListHeight.h,
    decoration: BoxDecoration(border: Border.all(color: textBlack)),
  );
}

Container bigfourbysix() {
  return Container(
    width: jonListWidth.w,
    height: jonListHeight.h,
    decoration: BoxDecoration(border: Border.all(color: textBlack)),
  );
}

Container smallfourbyfour() {
  return Container(
    width: 20.w,
    height: jonListHeight.h,
    decoration: BoxDecoration(border: Border.all(color: textBlack)),
  );
}

Container bigfourbyfour() {
  return Container(
    width: jonListWidth.w,
    height: jonListHeight.h,
    decoration: BoxDecoration(border: Border.all(color: textBlack)),
  );
}
