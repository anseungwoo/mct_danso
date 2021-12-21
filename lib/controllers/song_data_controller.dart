import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_danso/db/db.dart';
import 'package:project_danso/models/models.dart';

class SongController extends GetxController {
  var songList = Future.value([]).obs;

  @override
  void onInit() {
    super.onInit();

    // deleteAllSong(); // DB 초기화
    // insertSongToJson();
  }

  void updateLikeSongList(
      {required String songLike, required int songId}) async {
    // var data = await
    var like = songLike == 'true' ? 'false' : 'true';
    await DBHelPer().updateLikeSongList(like, songId);
    getAllSongList();
  }

  void getAllSongList() async {
    // await DBHelPer().getAllSongs().then((value) => {songList = value});
    songList.value = DBHelPer().getAllSongs();
    print('songList ${songList.value}');
    update();
  }

  void getExerSongList(int exerNum) async {
    // await DBHelPer().getAllSongs().then((value) => {songList = value});
    songList.value = DBHelPer().getExerSongs(exerNum);
    update();
  }

  // 단소 곡 DB 데이터 체크
  void insertSongToJson() async {
    await DBHelPer().getAllSongs().then((value) async {
      if (value.isEmpty || value == null || value == []) {
        var jsonString = await rootBundle.loadString('assets/json/song.json');
        final res = songFromJsonFromJson(jsonString);
        res.songData!.forEach((element) async {
          await DBHelPer().insertSongData(element);
        });
        print('DB 데이터 insert : $value');
      } else {
        getAllSongList();
      }
      print('현재 음악 데이터 : $value');
    });
  }

  void deleteAllSong() async {
    DBHelPer().deleteAllSongs();
    getAllSongList();
  }

  void insertSongDummyData() async {
    Dummy().insertSongDummy();
    getAllSongList();
    // update();
  }
}
