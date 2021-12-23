import 'dart:async';
import 'dart:typed_data';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:get/get.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';
import 'package:pitchupdart/instrument_type.dart';
import 'package:pitchupdart/pitch_handler.dart';
import 'package:project_danso/common/common.dart';

import 'package:project_danso/controllers/controllers.dart';

import 'package:project_danso/utils/danso_function.dart';
import 'package:project_danso/widgets/widgets.dart';

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
  // 정간보 변수
  int line = 0;
  int jungSection = 0;
  int next = 0;
  int next2 = 0;
  int pagenext = 1;
  int sheetHorizontal = 0;
  int copySheetHorizontal = 0;
  String jangDan = '';
  late int mill;
  late int sheetVertical;

  // =========================
  final _audioRecorder = FlutterAudioCapture();
  final pitchDetectorDart = PitchDetector(44100, 2000);
  final pitchupDart = PitchHandler(InstrumentType.guitar);
  PitchModelInterface pitchModelInterface = PitchModel();
  double pitchValue = 0;
  List<double> pitchValueList = [];
  late int micro;
  JungGanBo? jungGanBo;
  bool isChallenge = false;
  bool isPractice = false;
  bool isLevelPractice = false;
  int scoreResult = 0;
  var yulmyoungsCount = 0;
  final _tearController = Get.put(TearController());
  final _myHistoryController = Get.put(MyHistoryController());
  late List<dynamic> matchTrueFalse;

  final learningSongAndLevelController =
      Get.put(LearningSongAndLevelController());
  final playAndTestController = Get.put(PlayAndTestController());
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

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
  }

  @override
  void dispose() {
    line = jungGanBo!.sheet.length + 2;
    super.dispose();
  }

  void setJandan(var jangdan) async {
    await assetsAudioPlayer.open(
      Audio(getJandan(jangdan)),
      autoStart: false,
      loopMode: LoopMode.single,
    );
    setSpeed(speed[speedCount]);
    // await player.setAsset('assets/music/123123.mp3');
    // await player.setLoopMode(ja.LoopMode.one);
  }

  void setJangdanAndDansoSound(var songName) async {
    await assetsAudioPlayer.open(
      Audio(getSongFilePath(songName)),
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

  void setSpeed(speed) {
    assetsAudioPlayer.setPlaySpeed(speed);
  }

  void jandanPlay() async {
    await assetsAudioPlayer.setVolume(1);
    await assetsAudioPlayer.play();
  }

  void jandanStop() async {
    await assetsAudioPlayer.stop();
  }

  dynamic checkYulmyeongsSection(int i, {dynamic pitchValue}) {
    var data = jungGanBo!.sheet[i];

    if (data.divisionStatus == DivisionStatus.one) {
      if (data.yulmyeongs[0].yulmyeong != Yulmyeong.long &&
          data.yulmyeongs[0].yulmyeong != Yulmyeong.blank &&
          data.yulmyeongs[0].yulmyeong != Yulmyeong.rest) {
        if (pitchModelInterface.isCorrectPitch(
            pitchValue!, data.yulmyeongs[0])!) {
          matchTrueFalse[i][0] = true;
        }
      } else if (data.yulmyeongs[0].yulmyeong == Yulmyeong.long ||
          data.yulmyeongs[0].yulmyeong == Yulmyeong.blank ||
          data.yulmyeongs[0].yulmyeong == Yulmyeong.rest) {
        matchTrueFalse[i][0] = true;
      }

      return;
    } else if (data.divisionStatus == DivisionStatus.two) {
      if (data.yulmyeongs[0].yulmyeong != Yulmyeong.long &&
          data.yulmyeongs[0].yulmyeong != Yulmyeong.blank &&
          data.yulmyeongs[0].yulmyeong != Yulmyeong.rest) {
        if (pitchModelInterface.isCorrectPitch(
            pitchValue!, data.yulmyeongs[0])!) {
          matchTrueFalse[i][0] = true;
        }
      } else if (data.yulmyeongs[0].yulmyeong == Yulmyeong.long ||
          data.yulmyeongs[0].yulmyeong == Yulmyeong.blank ||
          data.yulmyeongs[0].yulmyeong == Yulmyeong.rest) {
        matchTrueFalse[i][0] = true;
      }
      if (data.yulmyeongs[1].yulmyeong != Yulmyeong.long &&
          data.yulmyeongs[1].yulmyeong != Yulmyeong.blank &&
          data.yulmyeongs[1].yulmyeong != Yulmyeong.rest) {
        if (pitchModelInterface.isCorrectPitch(
            pitchValue!, data.yulmyeongs[1])!) {
          matchTrueFalse[i][1] = true;
        }
      } else if (data.yulmyeongs[1].yulmyeong == Yulmyeong.long ||
          data.yulmyeongs[1].yulmyeong == Yulmyeong.blank ||
          data.yulmyeongs[1].yulmyeong == Yulmyeong.rest) {
        matchTrueFalse[i][1] = true;
      }
      return;
    } else if (data.divisionStatus == DivisionStatus.three) {
      if (data.yulmyeongs[0].yulmyeong != Yulmyeong.long &&
          data.yulmyeongs[0].yulmyeong != Yulmyeong.blank &&
          data.yulmyeongs[0].yulmyeong != Yulmyeong.rest) {
        if (pitchModelInterface.isCorrectPitch(
            pitchValue!, data.yulmyeongs[0])!) {
          matchTrueFalse[i][0] = true;
        }
      } else if (data.yulmyeongs[0].yulmyeong == Yulmyeong.long ||
          data.yulmyeongs[0].yulmyeong == Yulmyeong.blank ||
          data.yulmyeongs[0].yulmyeong == Yulmyeong.rest) {
        matchTrueFalse[i][0] = true;
      }
      if (data.yulmyeongs[1].yulmyeong != Yulmyeong.long &&
          data.yulmyeongs[1].yulmyeong != Yulmyeong.blank &&
          data.yulmyeongs[1].yulmyeong != Yulmyeong.rest) {
        if (pitchModelInterface.isCorrectPitch(
            pitchValue!, data.yulmyeongs[1])!) {
          matchTrueFalse[i][1] = true;
        }
      } else if (data.yulmyeongs[1].yulmyeong == Yulmyeong.long ||
          data.yulmyeongs[1].yulmyeong == Yulmyeong.blank ||
          data.yulmyeongs[1].yulmyeong == Yulmyeong.rest) {
        matchTrueFalse[i][1] = true;
      }
      if (data.yulmyeongs[2].yulmyeong != Yulmyeong.long &&
          data.yulmyeongs[2].yulmyeong != Yulmyeong.blank &&
          data.yulmyeongs[2].yulmyeong != Yulmyeong.rest) {
        if (pitchModelInterface.isCorrectPitch(
            pitchValue!, data.yulmyeongs[2])!) {
          matchTrueFalse[i][2] = true;
        }
      } else if (data.yulmyeongs[2].yulmyeong == Yulmyeong.long ||
          data.yulmyeongs[2].yulmyeong == Yulmyeong.blank ||
          data.yulmyeongs[2].yulmyeong == Yulmyeong.rest) {
        matchTrueFalse[i][2] = true;
      }
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

  void setJungganboVariable() {
    pagenext = 1;
    line = 0;
    next = 0;
    next2 = 0;
    jungSection = 0;
    copySheetHorizontal = sheetHorizontal;
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
    setJungganboVariable();

    Timer.periodic(Duration(microseconds: micro ~/ speed[speedCount]), (timer) {
      if (line < jungGanBo!.sheet.length) {
        if (isChallenge) {
          // 도전하기 시작
          var pitchValueResult = pitchModelInterface
              .getModerateAverageFrequencyByListOfPitches(pitchValueList);
          // 도전하기 피치 체크
          checkYulmyeongsSection(line, pitchValue: pitchValueResult);
        }
        line++;
        pitchValueList.clear();

        // 정간보 다음 페이지
        if (copySheetHorizontal >= 4 &&
            line == 32 * pagenext &&
            sheetVertical == 8) {
          next += 4;
          next2 += 4;
          pagenext++;
          copySheetHorizontal -= 2;
        }
        if (copySheetHorizontal >= 4 &&
            line == 24 * pagenext &&
            sheetVertical == 6) {
          next += 4;
          next2 += 4;
          pagenext++;
          copySheetHorizontal -= 2;
        }
        if (copySheetHorizontal == 3 &&
            line == 24 * pagenext &&
            sheetVertical == 6) {
          next += 4;
          next2 += 2;
          pagenext++;
        }
        if (copySheetHorizontal == 3 &&
            line == 32 * pagenext &&
            sheetVertical == 8) {
          next += 4;
          next2 += 2;
          pagenext++;
        }
      } else if (line == jungGanBo!.sheet.length && isChallenge) {
        timer.cancel();
        for (var i = 0; i < jungGanBo!.sheet.length; i++) {
          for (var j = 0; j < jungGanBo!.sheet[i].yulmyeongs.length; j++) {
            if (matchTrueFalse[i][j] == true) {
              scoreResult++;
            }
          }
        }
        scoreResult = ((scoreResult / yulmyoungsCount) * 100).toInt();
        // 도전점수 DB 저장
        _myHistoryController.putChallangeHistorydDB(
            songId: songId, chalScore: scoreResult);
        // 경험치 추가
        _tearController.incrementExp(
            (scoreResult / 10.0) + learningSongAndLevelController.currentLevel);
        // 결과 페이지 이동
        Get.off(ResultScore(
          scrore: scoreResult,
          songTitle: songTitle,
          songId: songId,
        ));
        reset();
      } else if (line == jungGanBo!.sheet.length && isLevelPractice) {
        timer.cancel();
        // 연주곡 연습하기 경험치
        _tearController
            .incrementExp(learningSongAndLevelController.currentLevel + 1.0);
        reset();
        playAndTestController.stateCountTwo();
      } else if (line == jungGanBo!.sheet.length && isPractice) {
        // 단계별 연습
        timer.cancel();
        _tearController.incrementExp(1.0);
        reset();
        playAndTestController.stateCountTwo();
      } else {
        // 중지
        timer.cancel();
        reset();
      }
      update();
    });
  }
}
