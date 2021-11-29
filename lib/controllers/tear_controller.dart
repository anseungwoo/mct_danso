import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/db/db_helpers.dart';
import 'package:project_danso/models/level_model.dart';

class TearController extends GetxController {
  var userExp = 0.0.obs;
  var emblemAsset = ''.obs;
  var tearName = ''.obs;
  var nextTearExp = 0.0.obs;
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

  void getUserExp() async {
    try {
      // 경험치 정보 가져오는데 null 이면 변수에 0 넣어줌.
      userExp.value = await DBHelPer().getExp() ?? 0.0;
    } catch (e) {
      print('경험치 값 없음');
    } finally {
      // 변수 값을 insert 함
      if (userExp.value < 1.0) {
        inserUserExp(userExp.value);
      }
    }
  }

  void inserUserExp(double exp) async {
    // 테이블 초기화 후 insert
    DBHelPer().deleteExp();
    await DBHelPer().insertExp(LevelModel(levelExp: exp));
  }

  void updateUserExp(double exp) async {
    // 경험치 업데이트(새로 들어온 경험치 로직 필요)
    await DBHelPer().updateExp(exp);
  }

  void addExp(double addPoint) async {
    getUserExp();
    var result = userExp.value + addPoint;
    await DBHelPer().updateExp(result);
  }

  void changeTear() {
    var path = 'assets/images/tear/ic_';
    getUserExp();
    if (userExp.value <= 5) {
      emblemAsset.value = path + 'unranked.svg';
      tearName.value = TEAR_NAME[0];
      // 다음 티어 까지 경험치
      nextTearExp.value = 6.0;
    } else if (userExp.value <= 34) {
      emblemAsset.value = path + 'bronze.svg';
      tearName.value = TEAR_NAME[1];
      nextTearExp.value = 35.0;
    } else if (userExp.value <= 99) {
      emblemAsset.value = path + 'silver.svg';
      tearName.value = TEAR_NAME[2];
      nextTearExp.value = 100.0;
    } else if (userExp.value <= 299) {
      emblemAsset.value = path + 'gold.svg';
      tearName.value = TEAR_NAME[3];
      nextTearExp.value = 300.0;
    } else if (userExp.value <= 9999) {
      emblemAsset.value = path + 'platinum.svg';
      tearName.value = TEAR_NAME[4];
      nextTearExp.value = 10000.0;
    } else if (userExp.value > 9999) {
      emblemAsset.value = path + 'master.svg';
      tearName.value = TEAR_NAME[5];
      nextTearExp.value = 10000.0;
    }
  }
}
