import 'package:get/get.dart';

class ChartlistController extends GetxController {
  int levelChange = 0;
  bool like = false;
  void likeChangeState() {
    like = !like;
    update();
  }

  void nextLevel() {
    if (levelChange < 3) {
      levelChange++;
    }

    update();
  }

  void previousLevel() {
    if (levelChange > 0) {
      levelChange--;
    }

    update();
  }
}
