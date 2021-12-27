import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:project_danso/common/common.dart';

class GameTimerWidget extends StatefulWidget {
  final int timer;
  GameTimerWidget({Key? key, required this.timer}) : super(key: key);

  @override
  _GameTimerWidgetState createState() => _GameTimerWidgetState();
}

class _GameTimerWidgetState extends State<GameTimerWidget> {
  late Timer _timer;

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
    var oneSec = Duration(microseconds: widget.timer);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      timer.cancel();
      Navigator.pop(context);
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
          Text(
            '반주 후 시작합니다. 준비해주세요',
            style:
                TextStyle(fontSize: 20.sp, color: MctColor.white.getMctColor),
          ),
        ],
      ),
    );
  }
}
