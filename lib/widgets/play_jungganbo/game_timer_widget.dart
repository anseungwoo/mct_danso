import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';

class GameTimerWidget extends StatefulWidget {
  const GameTimerWidget({Key? key}) : super(key: key);

  @override
  _GameTimerWidgetState createState() => _GameTimerWidgetState();
}

class _GameTimerWidgetState extends State<GameTimerWidget> {
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
      width: 200.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              SizedBox(
                width: 100.w,
                height: 100.w,
                child: CircularProgressIndicator(
                  color: unButtonColorOrang,
                  strokeWidth: 5,
                ),
              ),
              SizedBox(
                width: 100.w,
                height: 100.w,
                child: Center(
                  child: Text(
                    '$_start',
                    style: TextStyle(fontSize: 30, color: unButtonColorOrang),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            '3초후 시작합니다. 준비해주세요',
            style: TextStyle(fontSize: 20.sp, color: white),
          ),
        ],
      ),
    );
  }
}
