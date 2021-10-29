import 'package:get/get.dart';
import 'package:project_danso/db/db_helpers.dart';

class ChalDataController extends GetxController {
  var myHistoryList = Future.value([]).obs;
  var myHistoryGraph = [].obs;

  @override
  void onInit() {
    super.onInit();
    getMyHistoryList();
  }

  getMyHistoryList() {
    myHistoryList.value = DBHelPer().readMyHistoryData();
    update();
  }

  getMyHistoryGraphData(int songId) async {
    var data = await DBHelPer().readMyHistoryGraph(songId);
    if (data != null) {
      myHistoryGraph.assignAll(data);
    }
  }
}
