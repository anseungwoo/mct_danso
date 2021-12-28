import 'package:get/get.dart';
import 'package:project_danso/db/db.dart';

class LikeSongController extends GetxController {
  var likeSongList = [].obs;

  void getLikeSongList() async {
    likeSongList.clear();
    var data = await DBHelPer().readLikeSongList();
    likeSongList.assignAll(data);
  }

  void updateLikeSongList(
      {required String songLike, required int songId}) async {
    var like = songLike == 'true' ? 'false' : 'true';
    await DBHelPer().updateLikeSongList(like, songId);
    getLikeSongList();
  }
}
