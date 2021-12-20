import 'dart:io';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:project_danso/db/db.dart';
import 'package:project_danso/models/models.dart';

class MyHistoryController extends GetxController {
  var historyList = <MyHistoryModel>[].obs;
  var reversedHistoryList = <MyHistoryModel>[];

  var historyGraphList = <MyHistoryModel>[];
  var reversedHistoryGraphList = <MyHistoryModel>[];

  void putChallangeHistorydDB({required songId, required chalScore}) {
    // song_id, exer_type, exer_path, exer_time
    var date = DateTime.now().toString();

    DBHelPer().insertChalData(ChallangeModel(
      songId: songId,
      chalScore: chalScore,
      chalTime: date,
    ));
    print('저장된 songId : $songId');
  }

  void getMyHistoryList() async {
    try {
      var data = await DBHelPer().readMyHistoryList();
      print('내기록 데이터 $data');
      historyList.clear();
      historyList.assignAll(data);
      reversedHistoryList = historyList.reversed.toList();
    } catch (e) {
      print('내기록 데이터 없음');
    }
    update();
  }

  Future<void> getMyHistoryGraphList(var songId) async {
    try {
      var data = await DBHelPer().readMyHistoryGraph(songId);
      print('내기록 그래프 데이터 $data');
      historyGraphList.clear();
      historyGraphList.assignAll(data);
      reversedHistoryGraphList = historyGraphList.reversed.toList();
    } catch (e) {
      print('내기록 그래프 데이터 없음');
    }
    update();
  }
}
