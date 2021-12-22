import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TearController extends GetxController {
  var userExp = 0.0;
  var emblemAsset = 'assets/images/tear/ic_unranked.svg';
  var tearName = '단소 입문자';
  var nextTearExp = 0.0;

  @override
  void onInit() {
    super.onInit();
    getTearInfo();
  }

  @override
  void onClose() {
    getTearInfo();
    super.onClose();
  }

  Future<void> loadExp() async {
    var prefs = await SharedPreferences.getInstance();
    userExp = (prefs.getDouble('exp') ?? 0.0);
    print('load userExp : $userExp');
  }

  void incrementExp(double addExp) async {
    var prefs = await SharedPreferences.getInstance();
    userExp = (prefs.getDouble('exp') ?? 0.0) + addExp.ceil();
    await prefs.setDouble('exp', userExp);
    print('setter userExp : $userExp');
  }

  void getTearInfo() async {
    await loadExp();

    if (userExp <= 5) {
      setEmblemAssetAndTearName('unranked', 0, 6.0);
    } else if (userExp <= 34) {
      setEmblemAssetAndTearName('bronze', 1, 35.0);
    } else if (userExp <= 99) {
      setEmblemAssetAndTearName('silver', 2, 100.0);
    } else if (userExp <= 299) {
      setEmblemAssetAndTearName('gold', 3, 300.0);
    } else if (userExp <= 999) {
      setEmblemAssetAndTearName('platinum', 4, 1000.0);
    } else if (userExp > 9999) {
      setEmblemAssetAndTearName('master', 5, 10000.0);
    }
    update();
  }

  void setEmblemAssetAndTearName(
      var rankedName, tearNum, double setNextTearExp) {
    var path = 'assets/images/tear/ic_' + rankedName + '.svg';
    emblemAsset = path;
    tearName = TEAR_NAME[tearNum];
    // 다음 티어 까지 경험치
    nextTearExp = setNextTearExp;
  }
}
