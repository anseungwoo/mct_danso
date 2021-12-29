import 'dart:io';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:project_danso/db/db.dart';
import 'package:project_danso/models/models.dart';

class AudioAndVideoDBController extends GetxController {
  void putAudioAndVideoRecordDB(
      {required songId, required exerType, required exerPath}) {
    var date = DateTime.now().toString();
    String? fileName = basename(exerPath);

    DBHelPer().insertExerData(ExerciseModel(
      songId: songId,
      exerType: exerType,
      exerPath: Platform.isIOS ? fileName : exerPath,
      exerTime: date,
    ));
    print('저장된 songId : $songId');
  }
}
