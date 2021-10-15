import 'package:get/get.dart';

class PlayAndTestController extends GetxController {
  bool platState = false;
  String buttonSwap = '도전하기';
  bool testState = false;
  bool testStartState = false;
  String testButtonswap = '연습하기';
  int statecount = 0;
  void changePlayStopState() {
    platState = !platState;
    buttonSwap = platState ? '중지' : '도전하기';
    update();
  }

  void testButtonState() {
    testState = !testState;
    buttonSwap = testState ? '연습시작' : '도전하기';
    testButtonswap = testState ? '녹화하기' : '연습하기';
    update();
  }

  void testStartButtonState() {
    testStartState = !testStartState;
    buttonSwap = testStartState ? '중지' : '연습시작';
    testButtonswap = testStartState ? '반주만' : '녹화하기';
    update();
  }

  void stateCountUp(int v) {
    statecount = v;
    update();
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
