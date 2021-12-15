import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_danso/db/db_helpers.dart';
import 'package:project_danso/models/models.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';

class AudioAndVideoListController extends GetxController {
  static AudioAndVideoListController get to => Get.find();
  var audioList = <ExerciseModel>[].obs;
  var videoList = <ExerciseModel>[].obs;
  bool isRecord = false;
  @override
  void onInit() {
    super.onInit();
    getAudioList();
    getVideoList();
  }

  void getAudioList() async {
    var data = await DBHelPer().readExerSoundData();
    print('저장된 오디오 데이터 $data');
    audioList.clear();
    audioList.assignAll(data);
  }

  void getVideoList() async {
    var data = await DBHelPer().readExerVideoData();
    print('저장된 비디오 데이터 $data');
    videoList.clear();
    videoList.assignAll(data);
  }

  String convertDateFormat(var date) {
    // var dateFormat = DateFormat('yyyy년 MM월 dd일 HH시 mm분');
    // print(DateFormat.jm().format(DateFormat('hh:mm:ss').parse(date)));

    var dateTime = DateTime.parse(date);
    var dateFormat = DateFormat('yyyy/MM/dd').format(dateTime);
    var hourAndMinute = DateFormat('hh:mm a').format(dateTime);
    var result = '$dateFormat $hourAndMinute';
    // var result = dateFormat.format(dateTime);
    return result;
  }

  void audioRecordState(bool state) {
    isRecord = state;
  }

  void audioDeleteFile(String? path) async {
    try {
      final _localFile = File('$path');
      print(_localFile);
      final file = _localFile;
      await file.delete();
      Get.back();
    } catch (e) {
      return;
    }
    Get.back();
  }

  void recordDeleteFile(String? path) async {
    var getdir = (await getApplicationDocumentsDirectory()).path;

    try {
      if (Platform.isIOS) {
        final _localFile = File('$getdir/$path');
        print(_localFile);
        final file = _localFile;
        await file.delete();
        Get.back();
      } else if (Platform.isAndroid) {
        final _localFile = File('$path');
        print(_localFile);
        final file = _localFile;
        await file.delete();
        Get.back();
      }
    } catch (e) {
      return;
    }
    Get.back();
  }

  void shareFile(String? path) {
    Share.shareFiles([path!], text: 'my Good File');
  }
}
