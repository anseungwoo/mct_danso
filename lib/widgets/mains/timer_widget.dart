import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:project_danso/common/common.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  int _start = 3;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void startTimer() {
    const oneSec = Duration(milliseconds: 1000);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          Navigator.pop(context);
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 200.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              SizedBox(
                width: 100.w,
                height: 100.w,
                child: CircularProgressIndicator(
                  color: MctColor.unButtonColorOrange.getMctColor,
                  strokeWidth: 5,
                ),
              ),
              SizedBox(
                width: 100.w,
                height: 100.w,
                child: Center(
                  child: Text(
                    '$_start',
                    style: TextStyle(
                        fontSize: 30,
                        color: MctColor.unButtonColorOrange.getMctColor),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            '태(汰)를 부를 준비하세요....',
            style: TextStyle(fontSize: 19.sp),
          ),
        ],
      ),
    );
  }
}
