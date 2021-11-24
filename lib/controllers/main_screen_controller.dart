import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project_danso/common/const.dart';

class MainScreenController extends GetxController with WidgetsBindingObserver {
  bool svgState = false;
  bool musicState = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void SvgStateChange() {
    svgState = !svgState;
    update();
  }

  void MusicStateChange() {
    musicState = !musicState;
    update();
  }
}
