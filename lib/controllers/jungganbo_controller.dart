import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:get/get.dart';
import 'package:project_danso/utils/common/constants/MidiNoteConst.dart';
import 'package:project_danso/utils/danso_function.dart';

class JungganboController extends GetxController {
  bool startStopState = false;
  String startButton = '시작하기';
  int speedCount = 2;
  List speed = [0.8, 0.9, 1.0, 1.1, 1.2];
  bool krState = false;
  String krButton = '한자';

  late int mill;
  late JungGanBo jungGanBo;

  late int sheetVertical;
  bool gameState = false;
  IndexManager indexManagers = IndexManager();
  @override
  void onInit() {
    super.onInit();

    pagenext = 1;
    line = 0;
    next = 0;
    speedCount = 2;
    next2 = 0;
    jungSection = 0;
    startStopState = false;
    copySheetHorizontal = sheetHorizontal;
    startButton = '시작하기';
    indexManagers.clearIndex();
  }

  @override
  void dispose() {
    allMidiStop();
    line = jungGanBo.sheet.length;

    super.dispose();
  }

  void changegameState() {
    gameState = !gameState;

    update();
  }

  void changekrState() {
    krState = !krState;
    krButton = krState ? '한글' : '한자';
    update();
  }

  void changeStartStopState() {
    startStopState = !startStopState;
    startButton = startStopState ? '종료하기' : '시작하기';
    update();
  }

  void changespeedState() {
    speedCount++;
    if (speedCount == 5) {
      speedCount = 0;
    }
    update();
  }

  int line = 0;
  int jungSection = 0;
  int next = 0;
  int next2 = 0;
  int pagenext = 1;
  int sheetHorizontal = 0;
  int copySheetHorizontal = 0;

  void setting() {
    pagenext = 1;
    line = 0;
    next = 0;
    next2 = 0;
    jungSection = 0;
    copySheetHorizontal = sheetHorizontal;
    indexManagers.clearIndex();
  }

  void reset() {
    pagenext = 1;
    line = 0;
    next = 0;
    next2 = 0;
    speedCount = 2;
    startButton = '시작하기';
    jungSection = 0;
    copySheetHorizontal = sheetHorizontal;
    indexManagers.clearIndex();
  }

  void stepStop() {
    line = jungGanBo.sheet.length;

    update();
  }

  void stepStart() async {
    copySheetHorizontal = sheetHorizontal;
    setting();
    print('결과값 $copySheetHorizontal');
    print('mill ${speed[speedCount]}');
    await Future.delayed(
        Duration(milliseconds: (mill * (2 - speed[speedCount])).toInt()));
    Timer.periodic(
        Duration(milliseconds: (mill * (2 - speed[speedCount])).toInt()),
        (timer) {
      if (line < jungGanBo.sheet.length) {
        line++;

        if (copySheetHorizontal >= 4 &&
            line == 32 * pagenext &&
            sheetVertical == 8) {
          next += 4;
          next2 += 4;
          pagenext++;
          copySheetHorizontal -= 2;

          print('결과값4 $copySheetHorizontal');
          print('n1 $next');
          print('n2 $next2');
          print('np $pagenext');
        }
        if (copySheetHorizontal >= 4 &&
            line == 24 * pagenext &&
            sheetVertical == 6) {
          next += 4;
          next2 += 4;
          pagenext++;
          copySheetHorizontal -= 2;

          print('결과값4 $copySheetHorizontal');
          print('n1 $next');
          print('n2 $next2');
          print('np $pagenext');
        }
        if (copySheetHorizontal == 3 &&
            line == 24 * pagenext &&
            sheetVertical == 6) {
          next += 4;
          next2 += 2;
          pagenext++;

          print('결과값3 $copySheetHorizontal');
          print('n1 $next');
          print('n2 $next2');
          print('np $pagenext');
        }
        if (copySheetHorizontal == 3 &&
            line == 32 * pagenext &&
            sheetVertical == 8) {
          next += 4;
          next2 += 2;
          pagenext++;

          print('결과값3 $copySheetHorizontal');
          print('n1 $next');
          print('n2 $next2');
          print('np $pagenext');
        }
      } else {
        timer.cancel();

        reset();
      }
      update();
    });
  }

  final player = FlutterMidi();
  void playJungGanBo(IndexManager indexManager) {
    indexManager.clearIndex();
    Timer.periodic(
        Duration(milliseconds: (mill * (2 - speed[speedCount])).toInt()),
        (timer) {
      if (indexManager.index < jungGanBo.sheet.length) {
        playJung(jungGanBo.sheet[indexManager.index],
            (mill * speed[speedCount]).toInt());
        indexManager.addOneIndex();
        if (indexManager.index == jungGanBo.sheet.length) {
          timer.cancel();
          allMidiStop();
          indexManager.clearIndex();
        }
      } else {
        timer.cancel();
        allMidiStop();
        indexManager.clearIndex();
      }
    });
    allMidiStop();
  }

  playJung(Jung jung, int durationTime) {
    int halfOfDurationTime = durationTime ~/ 2;
    int oneOfThreeDurationTime = durationTime ~/ 3;
    if (jung.divisionStatus == DivisionStatus.one) {
      if (jung.yulmyeongs[0].yulmyeong != Yulmyeong.long &&
          jung.yulmyeongs[0].yulmyeong != Yulmyeong.blank) {
        allMidiStop();
      }
      //sleep(new Duration(milliseconds: 10));
      playOneYulmyeongNote(jung.yulmyeongs[0]);
      return;
    } else if (jung.divisionStatus == DivisionStatus.two) {
      if (jung.yulmyeongs[0].yulmyeong != Yulmyeong.long &&
          jung.yulmyeongs[0].yulmyeong != Yulmyeong.blank) {
        allMidiStop();
      }
      playOneYulmyeongNote(jung.yulmyeongs[0]);
      sleep(new Duration(milliseconds: halfOfDurationTime));

      if (jung.yulmyeongs[1].yulmyeong != Yulmyeong.long &&
          jung.yulmyeongs[1].yulmyeong != Yulmyeong.blank) {
        allMidiStop();
      }
      //sleep(new Duration(milliseconds: 10));
      playOneYulmyeongNote(jung.yulmyeongs[1]);
      return;
    } else if (jung.divisionStatus == DivisionStatus.three) {
      if (jung.yulmyeongs[0].yulmyeong != Yulmyeong.long &&
          jung.yulmyeongs[0].yulmyeong != Yulmyeong.blank) {
        allMidiStop();
      }
      playOneYulmyeongNote(jung.yulmyeongs[0]);
      sleep(new Duration(milliseconds: oneOfThreeDurationTime));
      if (jung.yulmyeongs[1].yulmyeong != Yulmyeong.long &&
          jung.yulmyeongs[1].yulmyeong != Yulmyeong.blank) {
        allMidiStop();
      }
      //sleep(new Duration(milliseconds: 10));
      playOneYulmyeongNote(jung.yulmyeongs[1]);
      sleep(new Duration(milliseconds: oneOfThreeDurationTime));
      if (jung.yulmyeongs[2].yulmyeong != Yulmyeong.long &&
          jung.yulmyeongs[2].yulmyeong != Yulmyeong.blank) {
        allMidiStop();
      }
      //sleep(new Duration(milliseconds: 10));
      playOneYulmyeongNote(jung.yulmyeongs[2]);
      return;
    }
  }

  playOneYulmyeongNoteDuringDurationTime(
      YulmyeongNote yulmyeongNote, int durationTime) {
    int notePlayed = getMidiNoteFromYulmyeongNote(yulmyeongNote);
    player.playMidiNote(midi: notePlayed);

    Timer(new Duration(milliseconds: durationTime), () {
      player.stopMidiNote(midi: notePlayed);
    });
  }

  playOneYulmyeongNote(YulmyeongNote yulmyeongNote) {
    int notePlayed = getMidiNoteFromYulmyeongNote(yulmyeongNote);
    player.playMidiNote(midi: notePlayed);
  }

  int getMidiNoteFromYulmyeongNote(YulmyeongNote yulmyeongNote) {
    int res = 0;
    if (yulmyeongNote.scaleStatus == ScaleStatus.origin) {
      switch (yulmyeongNote.yulmyeong) {
        case Yulmyeong.joong:
          res = JOONG_NOTE;
          break;
        case Yulmyeong.yim:
          res = YIM_NOTE;
          break;
        case Yulmyeong.moo:
          res = MOO_NOTE;
          break;
        case Yulmyeong.hwang:
          res = HWANG_NOTE;
          break;
        case Yulmyeong.tae:
          res = TAE_NOTE;
          break;
        case Yulmyeong.blank:
          res = REST_NOTE;
          break;
        case Yulmyeong.rest:
          res = REST_NOTE;
          break;
        default: //high:
      }
    } else {
      switch (yulmyeongNote.yulmyeong) {
        case Yulmyeong.joong:
          res = JOONG_HIGH_NOTE;
          break;
        case Yulmyeong.yim:
          res = YIM_HIGH_NOTE;
          break;
        case Yulmyeong.moo:
          res = MOO_HIGH_NOTE;
          break;
        case Yulmyeong.hwang:
          res = HWANG_HIGH_NOTE;
          break;
        case Yulmyeong.tae:
          res = TAE_HIGH_NOTE;
          break;
        case Yulmyeong.blank:
          res = REST_NOTE;
          break;
        case Yulmyeong.rest:
          res = REST_NOTE;
          break;
        default:
      }
    }
    return res;
  }

  allMidiStop() {
    for (var i = 0; i < 128; i++) {
      player.stopMidiNote(midi: i);
    }
  }

  endMidi() {
    for (var i = 0; i < 128; i++) {
      player.stopMidiNote(midi: i);
    }
  }
}

class IndexManager {
  int _index = 0;
  int get index => _index;

  addOneIndex() {
    _index++;
  }

  stopIndex() {
    _index = 1000000;
  }

  clearIndex() {
    _index = 0;
  }
}
