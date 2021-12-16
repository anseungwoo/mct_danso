import 'package:get/get.dart';

class PlayAndTestController extends GetxController {
  bool platState = false;
  bool testState = false;
  bool testStartState = false;
  int statecount = 0;
  int test = 0;
  String krButton = '한자버전';
  bool krChanges = false;

  @override
  void onInit() {
    super.onInit();
    reset();
  }

  void reset() {
    platState = false;

    testState = false;
    testStartState = false;
  }

  void changeKrState() {
    krChanges = !krChanges;
    krButton = krChanges ? '한글버전' : '한자버전';
    update();
  }

  void stateCountUp(int v) {
    statecount = v;
    update();
  }

  void stateCountTwo() {
    statecount = 0;
    reset();
  }

  void nextButton() {
    statecount++;
    update();
  }

  void previousButton() {
    statecount--;
    update();
  }
}
