import 'package:get/get.dart';
import 'package:project_danso/db/db_helpers.dart';

class LearningSongAndLevelController extends GetxController {
  int currentLevel = 1;
  var songList = [].obs;

  @override
  void onInit() {
    super.onInit();
    getExerSongList(1);
  }

  void nextLevel() {
    if (currentLevel < 4) {
      currentLevel++;
      getExerSongList(currentLevel);
      update();
    }
  }

  void previousLevel() {
    if (currentLevel > 1) {
      currentLevel--;
      getExerSongList(currentLevel);
      update();
    }
  }

  void getExerSongList(int exerNum) async {
    var data = await DBHelPer().getExerSongs(exerNum);
    if (data.isNotEmpty || data != []) {
      songList.assignAll(data);
      print('$exerNum 레벨');
      update();
    } else {
      print('$exerNum 레벨 곡 없음');
    }
  }

  void updateLikeSongList({String songLike, int songId, int exerNum}) async {
    // var data = await
    var like = songLike == 'true' ? 'false' : 'true';
    await DBHelPer().updateLikeSongList(like, songId);
    getExerSongList(exerNum);
  }
}
