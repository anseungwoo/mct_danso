import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';

class ReslutScoreController extends GetxController {
  String iamge = STAR_SVG[0];
  String comment = "";
  int? score;

  void resultText() {
    if (0 < score! && score! <= 25) {
      iamge = STAR_SVG[0];
      comment = '연습해볼까요!';
    }
    if (25 < score! && score! <= 50) {
      iamge = STAR_SVG[0];
      comment = '조금아쉬워요!';
    }
    if (50 < score! && score! <= 75) {
      iamge = STAR_SVG[1];
      comment = '참잘했어요!';
    }
    if (75 < score! && score! <= 90) {
      iamge = STAR_SVG[1];
      comment = '아주잘했어요!';
    }
    if (90 < score! && score! <= 100) {
      iamge = STAR_SVG[2];
      comment = '완벽해요!';
    }
    update();
  }
}
