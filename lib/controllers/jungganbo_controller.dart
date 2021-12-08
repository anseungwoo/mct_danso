import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:get/get.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';
import 'package:pitchupdart/instrument_type.dart';
import 'package:pitchupdart/pitch_handler.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/utils/common/constants/MidiNoteConst.dart';
import 'package:project_danso/utils/danso_function.dart';
import 'package:audio_session/audio_session.dart';
import 'package:project_danso/widgets/widgets.dart';

class JungganboController extends GetxController {
  bool startStopState = false;
  String startButton = '시작하기';
  int speedCount = 2;
  List speed = [0.8, 0.9, 1.0, 1.1, 1.2];
  bool krState = false;
  String krButton = '한자';
  int line = 0;
  int jungSection = 0;
  int next = 0;
  int next2 = 0;
  int pagenext = 1;
  int sheetHorizontal = 0;
  int copySheetHorizontal = 0;
  String janDan = "";
  final _audioRecorder = FlutterAudioCapture();
  final pitchDetectorDart = PitchDetector(44100, 2000);
  final pitchupDart = PitchHandler(InstrumentType.guitar);
  PitchModelInterface pitchModelInterface = PitchModel();
  double pitchValue = 0;
  List<double> pitchValueList = [];
  late int mill;
  JungGanBo? jungGanBo;
  late AudioSession audioSessions;
  bool isPitchDetector = false;
  late int sheetVertical;

  IndexManager indexManagers = IndexManager();
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
    isPitchDetector = false;
    copySheetHorizontal = sheetHorizontal;
    startButton = '시작하기';
    indexManagers.clearIndex();
  }

  @override
  void dispose() {
    allMidiStop();
    line = jungGanBo!.sheet.length;

    super.dispose();
  }

  void setJandan() {
    assetsAudioPlayer.open(
      Audio(getJandan()),
      autoStart: false,
      loopMode: LoopMode.single,
    );
  }

  String getJandan() {
    String res = "";

    switch (janDan) {
      case "중중모리장단":
        res = JUNGJUNG;
        break;
      case "굿거리장단":
        res = GOOD;
        break;
      case "세마치장단":
        res = SEMA;
        break;
      case "4박장단":
        res = HWI;
        break;
      case "자진모리장단":
        res = JAJIN;
        break;
      default: //high:

    }

    return res;
  }

  void setSpeed() {
    switch (janDan) {
      case "중중모리장단":
        assetsAudioPlayer.setPlaySpeed(1.265);
        break;
      case "굿거리장단":
        assetsAudioPlayer.setPlaySpeed(0.8);
        break;
      case "세마치장단":
        assetsAudioPlayer.setPlaySpeed(1.65);
        break;
      case "4박장단":
        assetsAudioPlayer.setPlaySpeed(0.65);
        break;
      case "자진모리장단":
        assetsAudioPlayer.setPlaySpeed(1.85);
        break;

      default: //high:

    }
  }

  void jandanPlay() async {
    await assetsAudioPlayer.setVolume(1);
    setSpeed();
    await Future.delayed(
        Duration(milliseconds: (mill * (2 - speed[speedCount])).toInt()));
    await assetsAudioPlayer.play();

    print('isplaying : $startStopState');
    update();
  }

  void jandanStop() async {
    await assetsAudioPlayer.stop();

    print('isplaying : $startStopState');
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

  void isPitchState() {
    isPitchDetector = !isPitchDetector;

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

  final List<bool> matchTrueFalse = [];
  bool ftSetting(int i) {
    for (var i = 0; i < jungGanBo!.sheet.length; i++) {
      matchTrueFalse.add(false);
    }
    return matchTrueFalse[i];
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
    setControllerConstants();
    stopCapture();
    if (isPitchDetector) {
      for (var i = 0; i < jungGanBo!.sheet.length; i++) {
        matchTrueFalse[i] = false;
      }
    }
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
    isPitchDetector = false;
    assetsAudioPlayer.stop();
  }

  void stepStop() {
    line = jungGanBo!.sheet.length + 1;
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

  void stepStart() async {
    copySheetHorizontal = sheetHorizontal;
    setting();
    print('결과값 $copySheetHorizontal');
    print('mill ${speed[speedCount]}');
    await Future.delayed(
        Duration(milliseconds: (mill / speed[speedCount]).toInt()));
    Timer.periodic(Duration(milliseconds: (mill / speed[speedCount]).toInt()),
        (timer) {
      if (line < jungGanBo!.sheet.length) {
        if (isPitchDetector) {
          double? pitchValueResult = pitchModelInterface
              .getModerateAverageFrequencyByListOfPitches(pitchValueList);
          if (jungGanBo!.sheet[line].yulmyeongs[0].yulmyeong ==
                  Yulmyeong.blank ||
              jungGanBo!.sheet[line].yulmyeongs[0].yulmyeong ==
                  Yulmyeong.rest ||
              jungGanBo!.sheet[line].yulmyeongs[0].yulmyeong ==
                  Yulmyeong.long) {
            matchTrueFalse[line] = true;
          } else if (pitchModelInterface.isCorrectPitch(
              pitchValueResult!, jungGanBo!.sheet[line].yulmyeongs[0])!) {
            print("선 :$pitchValueResult");
            matchTrueFalse[line] = true;
          }
          print("클후 :$pitchValueResult");
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
      } else if (line == jungGanBo!.sheet.length && isPitchDetector) {
        timer.cancel();
        Get.off(ResultScore());
        reset();
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
    Timer.periodic(Duration(milliseconds: (mill / speed[speedCount]).toInt()),
        (timer) {
      if (indexManager.index < jungGanBo!.sheet.length) {
        playJung(jungGanBo!.sheet[indexManager.index],
            (mill * speed[speedCount]).toInt());
        indexManager.addOneIndex();
        if (indexManager.index == jungGanBo!.sheet.length) {
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
