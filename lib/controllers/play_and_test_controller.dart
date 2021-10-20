import 'package:get/get.dart';

class PlayAndTestController extends GetxController {
  bool platState = false;
  String buttonSwap = '도전하기';
  bool testState = false;
  bool testStartState = false;
  String testButtonswap = '연습하기';
  int statecount = 0;
  List speed = [0.5, 0.7, 1.0, 1.2, 1.5, 2.0];
  int speedCount = 2;
  int test = 0;
  String krButton = '한글버전';
  bool krChanges = false;

  void reset() {
    platState = false;
    buttonSwap = '도전하기';
    testState = false;
    testStartState = false;
    testButtonswap = '연습하기';
    update();
  }

  void speedState() {
    speedCount++;
    if (speedCount == 6) {
      speedCount = 0;
    }
    update();
  }

  void changeKrState() {
    krChanges = !krChanges;
    krButton = krChanges ? '한자버전' : '한글버전';
    update();
  }

  void changePlayStopState() {
    platState = !platState;
    buttonSwap = platState ? '중지' : '도전하기';
    update();
  }

  void testButtonState() {
    testState = !testState;
    buttonSwap = testState ? '연습시작' : '도전하기';
    testButtonswap = testState ? '녹화' : '연습하기';
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
