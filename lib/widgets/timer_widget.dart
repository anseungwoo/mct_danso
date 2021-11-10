import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
      height: 200,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '태(汰)를 부를 준비하세요.',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            '$_start초',
            style: TextStyle(fontSize: 35),
          ),
          Text('뒤에 시작합니다'),
        ],
      ),
    );
  }
}
