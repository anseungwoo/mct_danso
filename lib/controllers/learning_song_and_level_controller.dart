import 'package:get/get.dart';
import 'package:project_danso/db/db_helpers.dart';
import 'package:project_danso/utils/danso_function.dart';

class LearningSongAndLevelController extends GetxController {
  int currentLevel = 1;
  var songList = [].obs;
  List yulmyeongHangeul = [
    '',
    [
      YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin)
    ],
    [
      YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin),
    ],
    [
      YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin),
    ],
    [
      YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin),
    ]
  ];
  List yulmyeongHanja = [
    '',
    [
      YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin)
    ],
    [
      YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.yim, ScaleStatus.high),
    ],
    [
      YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.joong, ScaleStatus.high),
      YulmyeongNote(Yulmyeong.yim, ScaleStatus.high),
    ],
    [
      YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin),
      YulmyeongNote(Yulmyeong.joong, ScaleStatus.high),
      YulmyeongNote(Yulmyeong.yim, ScaleStatus.high),
      YulmyeongNote(Yulmyeong.moo, ScaleStatus.high),
      YulmyeongNote(Yulmyeong.hwang, ScaleStatus.high),
      YulmyeongNote(Yulmyeong.tae, ScaleStatus.high),
    ]
  ];
  @override
  void onInit() {
    super.onInit();
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
    try {
      var data = await DBHelPer().getExerSongs(exerNum);
      if (data.isNotEmpty || data != []) {
        songList.assignAll(data);
        print('$exerNum 레벨');
        update();
      } else {
        print('$exerNum 레벨 곡 없음');
      }
    } catch (e) {
      print(e);
    }
  }

  void updateLikeSongList(
      {required String songLike,
      required int songId,
      required int exerNum}) async {
    // var data = await
    var like = songLike == 'true' ? 'false' : 'true';
    await DBHelPer().updateLikeSongList(like, songId);
    getExerSongList(exerNum);
  }
}
