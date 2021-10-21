import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget vertcal(List step) {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[0]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[1]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[2]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[3]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[4]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[5]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[6]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[7]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[8]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[9]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[10]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[11]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[12]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[13]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[14]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[15]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[16]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[17]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[18]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[19]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[20]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[21]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[22]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[23]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[24]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[25]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[26]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[27]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[28]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[29]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[30]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[31]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[32]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[33]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[34]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[35]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[36]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[37]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[38]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[39]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[40]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[41]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[42]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[43]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[44]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[45]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[46]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: jonWidth.w,
                height: jonHeight.h,
                decoration: BoxDecoration(border: Border.all(color: textBlack)),
                child: Center(
                    child: Text(
                  "${step[47]}",
                  style:
                      TextStyle(fontSize: textSingleSize.sp, fontWeight: bold),
                )),
              ),
              Container(
                width: 20.w,
                height: jonHeight.h,
                decoration: BoxDecoration(
                  border: Border.all(color: textBlack),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
