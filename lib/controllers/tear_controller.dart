import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/db/db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TearController extends GetxController {
  // shared preferences 얻기

// 값 저장하기
  var userExp = 0.0;
  var emblemAsset = '';
  var tearName = '';
  var nextTearExp = 0.0;
  // RxMap<String, double?> get tearExp => <String,double?>{
  //   'bronze': 35.0,
  //   'silver': 100.0,
  //   'gold': 300.0,
  //   'platinum': 9999.0,
  //   'master': 9999.0
  // }.obs;

  @override
  void onInit() {
    super.onInit();
    // DBHelPer().deleteExp();
  }

  //시작할 때 counter 값을 불러옵니다.
  void loadExp() async {
    var prefs = await SharedPreferences.getInstance();
    userExp = (prefs.getDouble('exp') ?? 0.0);
    print('load userExp : $userExp');
  }

  //클릭하면 counter를 증가시킵니다.
  void incrementExp(double addExp) async {
    var prefs = await SharedPreferences.getInstance();
    userExp = (prefs.getDouble('exp') ?? 0.0) + addExp;
    await prefs.setDouble('exp', userExp);
    print('setter userExp : $userExp');
  }

  void getUserExp() async {
    // try {
    // 경험치 정보 가져오는데 null 이면 변수에 0 넣어줌.
    userExp = await DBHelPer().getExp() ?? 0.0;
    // } catch (e) {
    // print('경험치 값 없음');
    // } finally {
    // 변수 값을 insert 함
    // if (userExp < 1.0) {
    //   inserUserExp(userExp);
    // }
    // }
  }

  // void inserUserExp(double exp) async {
  //   // 테이블 초기화 후 insert
  //   DBHelPer().deleteExp();
  //   await DBHelPer().insertExp(LevelModel(levelExp: exp));
  // }

  // void addExp(double addPoint) async {
  //   getUserExp();
  //   var result = userExp + addPoint;
  //   await DBHelPer().updateExp(result);
  //   getUserExp();
  //   print('추가 후 경험치 : $result');
  // }

  void getTearInfo() {
    loadExp();

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
