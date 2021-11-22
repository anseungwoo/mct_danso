import 'package:get/get.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/db/db_helpers.dart';

class LikeSongController extends GetxController {
  var likeSongList = [].obs;
  final SongController songController = Get.put(SongController());

  @override
  void onInit() {
    super.onInit();
    getLikeSongList();
  }

  @override
  void onClose() {
    super.onClose();
    songController.getAllSongList();
  }

  void getLikeSongList() async {
    var data = await DBHelPer().readLikeSongList();
    if (data != null) {
      likeSongList.assignAll(data);
    }
    // update();
  }

  void updateLikeSongList(
      {required String songLike, required int songId}) async {
    // var data = await
    var like = songLike == 'true' ? 'false' : 'true';
    await DBHelPer().updateLikeSongList(like, songId);
    getLikeSongList();
  }
}
