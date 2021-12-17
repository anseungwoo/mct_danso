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

  void getMyHistoryList() {
    myHistoryList.value = DBHelPer().readMyHistoryList();
    update();
  }

  void getMyHistoryGraphData(int songId) async {
    var data = await DBHelPer().readMyHistoryGraph(songId);
    myHistoryGraph.assignAll(data);
  }
}
