import 'package:get/get.dart';
import 'package:project_danso/db/db_helpers.dart';

class ExerDataController extends GetxController {
  var myHistoryList = Future.value([]).obs;
  var myHistoryGraph = [].obs;
  var mySoundRecord = [].obs;
  var myVideoRecord = [].obs;

  @override
  void onInit() {
    super.onInit();
    getMySoundRecord();
    getMyVideoRecord();
  }

  // 녹음 듣기
  void getMySoundRecord() async {
    var data = await DBHelPer().readExerSoundData();
    print(data);
    if (data != null) {
      mySoundRecord.assignAll(data);
    }
  }

  // 녹화 보기
  void getMyVideoRecord() async {
    var data = await DBHelPer().readExerVideoData();
    print(data);
    if (data != null) {
      myVideoRecord.assignAll(data);
    }
  }
}
