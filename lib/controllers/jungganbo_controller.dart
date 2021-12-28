import 'dart:async';
import 'dart:typed_data';
import 'package:audio_session/audio_session.dart';
import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:get/get.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';
import 'package:pitchupdart/instrument_type.dart';
import 'package:pitchupdart/pitch_handler.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/controllers/jangdan_and_danso_sound_controller.dart';
import 'package:project_danso/utils/danso_function.dart';
import 'package:project_danso/widgets/widgets.dart';

class JungganboController extends GetxController {
  bool startStopState = false;
  String startButton = '시작하기';
  bool krState = false;
  String krButton = '한자';
  bool isChallenge = false;
  bool isPractice = false;
  bool isLevelPractice = false;

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
  late int micro;
  JungGanBo? jungGanBo;
  int scoreResult = 0;
  var yulmyoungsCount = 0;
  // =========================

  //디텍터 변수
  final _audioRecorder = FlutterAudioCapture();
  final pitchDetectorDart = PitchDetector(44100, 2000);
  final pitchupDart = PitchHandler(InstrumentType.guitar);
  double pitchValue = 0;
  List<double> pitchValueList = [];
  late List<dynamic> matchTrueFalse;
  PitchModelInterface pitchModelInterface = PitchModel();
  //==============================================
  late AudioSession audioSessions;

  final _tearController = Get.put(TearController());
  final _myHistoryController = Get.put(MyHistoryController());
  final learningSongAndLevelController =
      Get.put(LearningSongAndLevelController());
  final playAndTestController = Get.put(PlayAndTestController());
  final jangdanAndDansoSoundController =
      Get.put(JangdanAndDansoSoundController());

  @override
  void onInit() {
    super.onInit();

    pagenext = 1;
    line = 0;
    next = 0;
    jangdanAndDansoSoundController.speedCount = 2;
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

  void buttonDelayState() {}
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

  audioSessionConfigure() =>
      AudioSession.instance.then((audioSession) async => await audioSession
          .configure(const AudioSessionConfiguration(
            avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
            avAudioSessionCategoryOptions:
                AVAudioSessionCategoryOptions.defaultToSpeaker,
            avAudioSessionMode: AVAudioSessionMode.videoRecording,
            avAudioSessionRouteSharingPolicy:
                AVAudioSessionRouteSharingPolicy.defaultPolicy,
            avAudioSessionSetActiveOptions:
                AVAudioSessionSetActiveOptions.notifyOthersOnDeactivation,
            // androidAudioAttributes: AndroidAudioAttributes(
            //   contentType: AndroidAudioContentType.music,
            //   flags: AndroidAudioFlags.none,
            //   usage: AndroidAudioUsage.media,
            // ),
            // androidAudioFocusGainType: AndroidAudioFocusGainType.gainTransient,
            // androidWillPauseWhenDucked: true,
          ))
          .then((_) => audioSessions = audioSession));

  void checkYulmyeongsSection(int i, {dynamic pitchValue}) {
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

//   void changespeedState() {
//     speedCount++;
//     if (speedCount == 5) {
//       speedCount = 0;
//     }

//     update();
//   }

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
    update();
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

  void changespeedState() {
    jangdanAndDansoSoundController.speedCount++;
    if (jangdanAndDansoSoundController.speedCount == 5) {
      jangdanAndDansoSoundController.speedCount = 0;
    }
    update();
  }

  void setControllerConstants() {
    pagenext = 1;
    line = 0;
    next = 0;
    next2 = 0;
    jangdanAndDansoSoundController.speedCount = 2;
    jungSection = 0;
    copySheetHorizontal = sheetHorizontal;
    startButton = '시작하기';
    startStopState = false;
    isChallenge = false;
    isLevelPractice = false;
    isPractice = false;
    jangdanAndDansoSoundController.jaPlayer.stop();
  }

  void stepStop() {
    line = jungGanBo!.sheet.length + 2;
  }

  void stepStart({var songId, songTitle}) async {
    create2DList();
    countingJungganboYulmyeong();
    copySheetHorizontal = sheetHorizontal;
    setJungganboVariable();
//     Timer.periodic(Duration(microseconds: micro ~/ speed[speedCount]), (timer) {

    Timer.periodic(
        Duration(
            microseconds: micro ~/
                jangdanAndDansoSoundController
                    .speed[jangdanAndDansoSoundController.speedCount]),
        (timer) {
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
