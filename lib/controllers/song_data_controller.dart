import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_danso/db/db_helpers.dart';
import 'package:project_danso/db/insert_dummy.dart';
import 'package:project_danso/models/models.dart';

class SongController extends GetxController {
  var songList = Future.value([]).obs;

  @override
  void onInit() {
    super.onInit();
    // getAllSongList();
    insertSongToJson();
  }

  updateLikeSongList({String songLike, int songId}) async {
    // var data = await
    var like = songLike == "true" ? "false" : "true";
    await DBHelPer().updateLikeSongList(like, songId);
    getAllSongList();
  }

  getAllSongList() async {
    // await DBHelPer().getAllSongs().then((value) => {songList = value});
    songList.value = DBHelPer().getAllSongs();
    update();
  }

  // 단소 곡 DB 데이터 체크
  insertSongToJson() async {
    await DBHelPer().getAllSongs().then((value) async {
      print(value);
      if (value.length < 1 || value == null || value == []) {
        String jsonString =
            await rootBundle.loadString('assets/json/song.json');
        final res = songFromJsonFromJson(jsonString);
        res.songData.forEach((element) async {
          await DBHelPer().insertSongData(element);
        });
      } else {
        getAllSongList();
      }
    });
  }

  deleteAllSong() async {
    DBHelPer().deleteAllSongs();
    getAllSongList();
  }

  insertSongDummyData() async {
    await Dummy().insertSongDummy();
    getAllSongList();
    // update();
  }
}
