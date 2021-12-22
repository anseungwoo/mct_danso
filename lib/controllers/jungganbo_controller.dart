import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:get/get.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';
import 'package:pitchupdart/instrument_type.dart';
import 'package:pitchupdart/pitch_handler.dart';
import 'package:project_danso/common/common.dart';
import 'package:just_audio/just_audio.dart' as ja;

import 'package:project_danso/controllers/controllers.dart';

import 'package:project_danso/utils/common/constants/MidiNoteConst.dart';
import 'package:project_danso/utils/danso_function.dart';
import 'package:project_danso/widgets/widgets.dart';
import 'package:just_audio/just_audio.dart' as ja;

class JungganboController extends GetxController {
  bool startStopState = false;
  String startButton = '시작하기';
  int speedCount = 2;
  List speed = [
    getSpeed(SongSpeed.eight),
    getSpeed(SongSpeed.nine),
    getSpeed(SongSpeed.ten),
    getSpeed(SongSpeed.eleven),
    getSpeed(SongSpeed.twelve)
  ];
  bool krState = false;
  String krButton = '한자';
  int line = 0;
  int jungSection = 0;
  int next = 0;
  int next2 = 0;
  int pagenext = 1;
  int sheetHorizontal = 0;
  int copySheetHorizontal = 0;
  String jangDan = '';
  final _audioRecorder = FlutterAudioCapture();
  final pitchDetectorDart = PitchDetector(44100, 2000);
  final pitchupDart = PitchHandler(InstrumentType.guitar);
  PitchModelInterface pitchModelInterface = PitchModel();
  double pitchValue = 0;
  List<double> pitchValueList = [];
  late int mill;
  JungGanBo? jungGanBo;
  bool isChallenge = false;
  bool isPractice = false;
  bool isLevelPractice = false;
  int scoreResult = 0;
  var yulmyoungsCount = 0;
  // late AudioSession audioSessions;
  final _tearController = Get.put(TearController());
  final _myHistoryController = Get.put(MyHistoryController());

  late int sheetVertical;
  LearningSongAndLevelController learningSongAndLevelController =
      Get.put(LearningSongAndLevelController());
  PlayAndTestController playAndTestController =
      Get.put(PlayAndTestController());
  IndexManager indexManagers = IndexManager();
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  // ja.AudioPlayer player = ja.AudioPlayer(
  //   handleInterruptions: false,
  //   // androidApplyAudioAttributes: false,
  //   handleAudioSessionActivation: false,
  // );

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
    isChallenge = false;
    copySheetHorizontal = sheetHorizontal;
    startButton = '시작하기';
    indexManagers.clearIndex();
  }

  @override
  void dispose() {
    line = jungGanBo!.sheet.length + 2;
    super.dispose();
  }

//   void setJandan(var jangdan) {
//     assetsAudioPlayer.open(
//       Audio(getJandan(jangdan)),
//       autoStart: false,
//       loopMode: LoopMode.single,
//     );

  void setJandan(var jangdan) async {
    await assetsAudioPlayer.open(
      Audio(getJandan(jangdan)),
      autoStart: false,
      loopMode: LoopMode.single,
    );
    // await player.setAsset('assets/music/123123.mp3');
    // await player.setLoopMode(ja.LoopMode.one);
  }

  void setJangdanAndDansoSound(var jangdanAndDanso) async {
    await assetsAudioPlayer.open(
      Audio(jangdanAndDanso),
      autoStart: false,
      loopMode: LoopMode.single,
    );
  }

  String getJandan(var jangdan) {
    // String res = '';

    switch (jangdan) {
      case '중중모리장단':
        return getAudioFilePath(AudioFile.JoongJoong);
      case '굿거리장단':
        return getAudioFilePath(AudioFile.Good);
      case '세마치장단':
        return getAudioFilePath(AudioFile.Semachi);
      case '4박장단':
        return getAudioFilePath(AudioFile.Huimori);
      case '자진모리장단':
        return getAudioFilePath(AudioFile.Jagin);
      default: //high:
        return '';
    }
  }

  void setSpeed(jangDan, speed) {
    switch (jangDan) {
      case '중중모리장단':
        assetsAudioPlayer.setPlaySpeed(1.26 * speed);

        break;
      case '굿거리장단':
        assetsAudioPlayer.setPlaySpeed(1.2 * speed);

        break;
      case '세마치장단':
        assetsAudioPlayer.setPlaySpeed(1.66 * speed);

        break;
      case '4박장단':
        assetsAudioPlayer.setPlaySpeed(0.66 * speed);

        break;
      case '자진모리장단':
        assetsAudioPlayer.setPlaySpeed(1.85 * speed);

        break;

      default: //high:

    }
  }

  void jandanPlay() async {
    await assetsAudioPlayer.setVolume(1);

    await assetsAudioPlayer.play();
    // await player.play();

    print('isplaying : $startStopState');
    update();
  }

  void jandanStop() async {
    await assetsAudioPlayer.stop();
    // await player.stop();
    print('isplaying : $startStopState');
  }

  dynamic checkYulmyeongsSection(int i, {dynamic pitchValue}) {
    var data = jungGanBo!.sheet[i];

    if (data.divisionStatus == DivisionStatus.one) {
      // print('division 1');

      if (data.yulmyeongs[0].yulmyeong != Yulmyeong.long &&
          data.yulmyeongs[0].yulmyeong != Yulmyeong.blank &&
          data.yulmyeongs[0].yulmyeong != Yulmyeong.rest) {
        if (pitchModelInterface.isCorrectPitch(
            pitchValue!, data.yulmyeongs[0])!) {
          matchTrueFalse[i][0] = true;
          print('division 1 : true ${data.yulmyeongs[0].toHangeul()}');
        }
      } else if (data.yulmyeongs[0].yulmyeong == Yulmyeong.long ||
          data.yulmyeongs[0].yulmyeong == Yulmyeong.blank ||
          data.yulmyeongs[0].yulmyeong == Yulmyeong.rest) {
        print('division 1 : false ${data.yulmyeongs[0].toHangeul()}');
        matchTrueFalse[i][0] = true;
      }
      print('division 1 : false ${data.yulmyeongs[0].toHangeul()}');

      return;
    } else if (data.divisionStatus == DivisionStatus.two) {
      // print('division 2');

      if (data.yulmyeongs[0].yulmyeong != Yulmyeong.long &&
          data.yulmyeongs[0].yulmyeong != Yulmyeong.blank &&
          data.yulmyeongs[0].yulmyeong != Yulmyeong.rest) {
        if (pitchModelInterface.isCorrectPitch(
            pitchValue!, data.yulmyeongs[0])!) {
          matchTrueFalse[i][0] = true;
          print('division 2-1 : true ${data.yulmyeongs[0].toHangeul()}');
        }
      } else if (data.yulmyeongs[0].yulmyeong == Yulmyeong.long ||
          data.yulmyeongs[0].yulmyeong == Yulmyeong.blank ||
          data.yulmyeongs[0].yulmyeong == Yulmyeong.rest) {
        print('division 2-1 : false ${data.yulmyeongs[0].toHangeul()}');
        matchTrueFalse[i][0] = true;
      }
      print('division 2-1 : false ${data.yulmyeongs[0].toHangeul()}');
      if (data.yulmyeongs[1].yulmyeong != Yulmyeong.long &&
          data.yulmyeongs[1].yulmyeong != Yulmyeong.blank &&
          data.yulmyeongs[1].yulmyeong != Yulmyeong.rest) {
        if (pitchModelInterface.isCorrectPitch(
            pitchValue!, data.yulmyeongs[1])!) {
          matchTrueFalse[i][1] = true;
          print('division 2-2 : true ${data.yulmyeongs[1].toHangeul()}');
        }
      } else if (data.yulmyeongs[1].yulmyeong == Yulmyeong.long ||
          data.yulmyeongs[1].yulmyeong == Yulmyeong.blank ||
          data.yulmyeongs[1].yulmyeong == Yulmyeong.rest) {
        matchTrueFalse[i][1] = true;
        print('division 2-2 : false ${data.yulmyeongs[1].toHangeul()}');
      }
      print('division 2-2 : false ${data.yulmyeongs[1].toHangeul()}');
      return;
    } else if (data.divisionStatus == DivisionStatus.three) {
      // print('division 3');
      if (data.yulmyeongs[0].yulmyeong != Yulmyeong.long &&
          data.yulmyeongs[0].yulmyeong != Yulmyeong.blank &&
          data.yulmyeongs[0].yulmyeong != Yulmyeong.rest) {
        if (pitchModelInterface.isCorrectPitch(
            pitchValue!, data.yulmyeongs[0])!) {
          matchTrueFalse[i][0] = true;
          print('division 3-1 : true ${data.yulmyeongs[0].toHangeul()}');
        }
      } else if (data.yulmyeongs[0].yulmyeong == Yulmyeong.long ||
          data.yulmyeongs[0].yulmyeong == Yulmyeong.blank ||
          data.yulmyeongs[0].yulmyeong == Yulmyeong.rest) {
        matchTrueFalse[i][0] = true;
        print('division 3-1 : false ${data.yulmyeongs[0].toHangeul()}');
      }
      print('division 3-1 : false ${data.yulmyeongs[0].toHangeul()}');
      if (data.yulmyeongs[1].yulmyeong != Yulmyeong.long &&
          data.yulmyeongs[1].yulmyeong != Yulmyeong.blank &&
          data.yulmyeongs[1].yulmyeong != Yulmyeong.rest) {
        if (pitchModelInterface.isCorrectPitch(
            pitchValue!, data.yulmyeongs[1])!) {
          matchTrueFalse[i][1] = true;
          print('division 3-2 : true ${data.yulmyeongs[1].toHangeul()}');
        }
      } else if (data.yulmyeongs[1].yulmyeong == Yulmyeong.long ||
          data.yulmyeongs[1].yulmyeong == Yulmyeong.blank ||
          data.yulmyeongs[1].yulmyeong == Yulmyeong.rest) {
        matchTrueFalse[i][1] = true;
        print('division 3-2 : false ${data.yulmyeongs[1].toHangeul()}');
      }
      print('division 3-2 : false ${data.yulmyeongs[1].toHangeul()}');
      if (data.yulmyeongs[2].yulmyeong != Yulmyeong.long &&
          data.yulmyeongs[2].yulmyeong != Yulmyeong.blank &&
          data.yulmyeongs[2].yulmyeong != Yulmyeong.rest) {
        if (pitchModelInterface.isCorrectPitch(
            pitchValue!, data.yulmyeongs[2])!) {
          matchTrueFalse[i][2] = true;
          print('division 3-3 : true ${data.yulmyeongs[2].toHangeul()}');
        }
      } else if (data.yulmyeongs[2].yulmyeong == Yulmyeong.long ||
          data.yulmyeongs[2].yulmyeong == Yulmyeong.blank ||
          data.yulmyeongs[2].yulmyeong == Yulmyeong.rest) {
        matchTrueFalse[i][2] = true;
        print('division 3-3 : false ${data.yulmyeongs[2].toHangeul()}');
      }
      print('division 3-3 : false ${data.yulmyeongs[2].toHangeul()}');
      return;
    }
  }

  void isChallengeState() {
    isChallenge = !isChallenge;
    update();
  }

  void isPracticeState() {
    isPractice = !isPractice;
    update();
  }

  void isLevelPracticeState() {
    isLevelPractice = !isLevelPractice;
    update();
  }

  Future delyButton() async {
    Future.delayed(Duration(seconds: 4), () {
      null;
    });
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

  late List<dynamic> matchTrueFalse;
  void create2DList() {
    matchTrueFalse = List.generate(
        jungGanBo!.sheet.length,
        (index) =>
            List.filled(jungGanBo!.sheet[index].yulmyeongs.length, false),
        growable: false);
  }

  void countingJungganboYulmyeong() {
    for (var i = 0; i < jungGanBo!.sheet.length; i++) {
      yulmyoungsCount += jungGanBo!.sheet[i].yulmyeongs.length;
    }
  }

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
    yulmyoungsCount = 0;
    setControllerConstants();
    stopCapture();
    if (isChallenge) {
      for (var i = 0; i < jungGanBo!.sheet.length; i++) {
        matchTrueFalse[i] = false;
      }
    }
    update();
  }

  void setControllerConstants() {
    pagenext = 1;
    line = 0;
    next = 0;
    next2 = 0;
    speedCount = 2;
    jungSection = 0;
    copySheetHorizontal = sheetHorizontal;
    startButton = '시작하기';
    startStopState = false;
    indexManagers.clearIndex();
    isChallenge = false;
    isLevelPractice = false;
    isPractice = false;
    assetsAudioPlayer.stop();
    // player.stop();
  }

  void stepStop() {
    line = jungGanBo!.sheet.length + 2;
  }

  Future<void> startCapture() async {
    await _audioRecorder.start(listener, onError,
        sampleRate: 44100, bufferSize: 3000);
    ;
    update();
  }

  Future<void> stopCapture() async {
    await _audioRecorder.stop();
  }

  void onError(Object e) {
    print(e);
  }

  void listener(dynamic obj) {
    //Gets the audio sample
    var buffer = Float64List.fromList(obj.cast<double>());
    final audioSample = buffer.toList();
    //Uses pitch_detector_dart library to detect a pitch from the audio sample
    final result = pitchDetectorDart.getPitch(audioSample);
    //If there is a pitch - evaluate it
    if (result.pitched) {
      //Uses the pitchupDart library to check a given pitch for a Guitar
      final handledPitchResult = pitchupDart.handlePitch(result.pitch);
      //Updates the state with the result

      pitchValue = result.pitch;
      pitchValueList.add(pitchValue);
      pitchModelInterface
          .getModerateAverageFrequencyByListOfPitches(pitchValueList);

      update();
    }
  }

  void stepStart({var songId, songTitle}) async {
    create2DList();
    countingJungganboYulmyeong();
    copySheetHorizontal = sheetHorizontal;
    setting();
    print('결과값 $copySheetHorizontal');
    print('mill ${speed[speedCount]}');

    Timer.periodic(Duration(microseconds: mill ~/ speed[speedCount]), (timer) {
      if (line < jungGanBo!.sheet.length) {
        if (isChallenge) {
          var pitchValueResult = pitchModelInterface
              .getModerateAverageFrequencyByListOfPitches(pitchValueList);
          checkYulmyeongsSection(line, pitchValue: pitchValueResult);
          print('클후 :$pitchValueResult');
        }

        line++;
        pitchValueList.clear();

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
      } else if (line == jungGanBo!.sheet.length && isChallenge) {
        timer.cancel();
        // _tearController.addExp(1.0);

        for (var i = 0; i < jungGanBo!.sheet.length; i++) {
          for (var j = 0; j < jungGanBo!.sheet[i].yulmyeongs.length; j++) {
            if (matchTrueFalse[i][j] == true) {
              scoreResult++;
            }
          }
        }
        print('갯수 $scoreResult');
        print(yulmyoungsCount);
        scoreResult = ((scoreResult / yulmyoungsCount) * 100).toInt();
        // 도전점수 DB 저장
        _myHistoryController.putChallangeHistorydDB(
            songId: songId, chalScore: scoreResult);
        _tearController.incrementExp(
            (scoreResult / 10.0) + learningSongAndLevelController.currentLevel);
        Get.off(ResultScore(
          scrore: scoreResult,
          songTitle: songTitle,
          songId: songId,
        ));
        reset();
      } else if (line == jungGanBo!.sheet.length && isLevelPractice) {
        timer.cancel();
        _tearController
            .incrementExp(learningSongAndLevelController.currentLevel + 1.0);
        reset();
        playAndTestController.stateCountTwo();
      } else if (line == jungGanBo!.sheet.length && isPractice) {
        timer.cancel();
        _tearController.incrementExp(1.0);
        reset();
        playAndTestController.stateCountTwo();
      } else {
        timer.cancel();
        reset();
      }
      update();
    });
  }

  final midiPlayer = FlutterMidi();
  // void playJungGanBo(IndexManager indexManager) {
  //   indexManager.clearIndex();
  //   Timer.periodic(Duration(milliseconds: mill ~/ speed[speedCount]), (timer) {
  //     if (indexManager.index < jungGanBo!.sheet.length) {
  //       playJung(jungGanBo!.sheet[indexManager.index],
  //           (mill * speed[speedCount]).toInt());
  //       indexManager.addOneIndex();
  //       if (indexManager.index == jungGanBo!.sheet.length) {
  //         timer.cancel();
  //         allMidiStop();
  //         indexManager.clearIndex();
  //       }
  //     } else {
  //       timer.cancel();
  //       allMidiStop();
  //       indexManager.clearIndex();
  //     }
  //   });
  //   allMidiStop();
  // }

  void playJung(Jung jung, int durationTime) {
    var halfOfDurationTime = durationTime ~/ 2;
    var oneOfThreeDurationTime = durationTime ~/ 3;
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
      // sleep(Duration(milliseconds: halfOfDurationTime));
      Timer.periodic(Duration(milliseconds: halfOfDurationTime), (timer) {
        if (jung.yulmyeongs[1].yulmyeong != Yulmyeong.long &&
            jung.yulmyeongs[1].yulmyeong != Yulmyeong.blank) {
          timer.cancel();
          allMidiStop();
        }
        //sleep(new Duration(milliseconds: 10));
        playOneYulmyeongNote(jung.yulmyeongs[1]);
        timer.cancel();
      });
      return;
    } else if (jung.divisionStatus == DivisionStatus.three) {
      if (jung.yulmyeongs[0].yulmyeong != Yulmyeong.long &&
          jung.yulmyeongs[0].yulmyeong != Yulmyeong.blank) {
        allMidiStop();
      }
      playOneYulmyeongNote(jung.yulmyeongs[0]);
      // sleep(Duration(milliseconds: oneOfThreeDurationTime));
      Timer.periodic(Duration(milliseconds: oneOfThreeDurationTime), (timer) {
        if (jung.yulmyeongs[1].yulmyeong != Yulmyeong.long &&
            jung.yulmyeongs[1].yulmyeong != Yulmyeong.blank) {
          timer.cancel();
          allMidiStop();
        }
        //sleep(new Duration(milliseconds: 10));
        playOneYulmyeongNote(jung.yulmyeongs[1]);
        timer.cancel();
      });
      // sleep(Duration(milliseconds: oneOfThreeDurationTime));
      Timer.periodic(Duration(milliseconds: oneOfThreeDurationTime), (timer) {
        if (jung.yulmyeongs[2].yulmyeong != Yulmyeong.long &&
            jung.yulmyeongs[2].yulmyeong != Yulmyeong.blank) {
          timer.cancel();
          allMidiStop();
        }
        //sleep(new Duration(milliseconds: 10));
        playOneYulmyeongNote(jung.yulmyeongs[2]);
        timer.cancel();
      });
      return;
    }
  }

  playOneYulmyeongNote(YulmyeongNote yulmyeongNote) {
    var notePlayed = getMidiNoteFromYulmyeongNote(yulmyeongNote);
    midiPlayer.playMidiNote(midi: notePlayed);
  }

  int getMidiNoteFromYulmyeongNote(YulmyeongNote yulmyeongNote) {
    var res = 0;
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
      midiPlayer.stopMidiNote(midi: i);
    }
  }

  endMidi() {
    for (var i = 0; i < 128; i++) {
      midiPlayer.stopMidiNote(midi: i);
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
