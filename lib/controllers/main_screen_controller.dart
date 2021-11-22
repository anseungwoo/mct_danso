import 'dart:async';

import 'package:get/get.dart';

class MainScreenController extends GetxController {
  bool svgState = false;

  void SvgStateChange() {
    svgState = !svgState;
    update();
  }
}
