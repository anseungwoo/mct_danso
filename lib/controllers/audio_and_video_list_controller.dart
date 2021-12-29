import 'dart:io';
import 'package:get/get.dart';
import 'package:project_danso/db/db.dart';
import 'package:project_danso/models/models.dart';
import 'package:share/share.dart';

class AudioAndVideoListController extends GetxController {
  static AudioAndVideoListController get to => Get.find();
  var audioList = <ExerciseModel>[].obs;
  var videoList = <ExerciseModel>[].obs;

  void getAudioList() async {
    try {
      var data = await DBHelPer().readExerSoundData();
      print('저장된 오디오 데이터 $data');
      audioList.clear();
      audioList.assignAll(data);
    } catch (e) {
      print('없음');
    }
  }

  void getVideoList() async {
    try {
      var data = await DBHelPer().readExerVideoData();
      print('저장된 비디오 데이터 $data');
      videoList.clear();
      videoList.assignAll(data);
    } catch (e) {
      print('없음');
    }
  }

  void DeleteFile(var path, exerId) async {
    await DBHelPer().deletePath(exerId);
    try {
      if (File(path!).existsSync()) {
        final _localFile = File('$path');
        print(_localFile);
        final file = _localFile;
        await file.delete();
        Get.back();
      } else {
        Get.back();
      }
    } catch (e) {
      return;
    }
    Get.back();
  }

  void shareFile(String? path) {
    // Share.shareFiles([path!], text: 'my Good File');
    Share.shareFiles([path!]);
  }
}
