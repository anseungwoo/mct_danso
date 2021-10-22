import 'package:get/get.dart';

class ChartlistController extends GetxController {
  int test = 0;
  List list1 = ["2", '2,2', '2,2,2,2,2', "2,32,3,2"];
  void nextpage() {
    if (test < 3) {
      test++;
    }

    update();
  }

  void previouspage() {
    if (test > 0) {
      test--;
    }

    update();
  }
}
