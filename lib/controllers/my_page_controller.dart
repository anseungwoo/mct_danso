import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPageController extends GetxController {
  bool starStopState = false;

  Icon startIcon = Icon(
    Icons.play_arrow,
    size: 40,
  );

  void changeStartStopState() {
    starStopState = !starStopState;
    startIcon = starStopState
        ? Icon(
            Icons.pause,
            size: 40,
          )
        : Icon(
            Icons.play_arrow,
            size: 40,
          );
    update();
  }
}
