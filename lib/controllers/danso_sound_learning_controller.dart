import 'dart:typed_data';

import 'package:danso_function/danso_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:get/get.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';
import 'package:pitchupdart/instrument_type.dart';
import 'package:pitchupdart/pitch_handler.dart';
import 'package:project_danso/common/const.dart';

import 'package:project_danso/db/db_helpers.dart';
import 'package:project_danso/models/models.dart';
import 'package:project_danso/widgets/main/loading_indicator.dart';
import 'package:project_danso/widgets/test_dialog.dart';
import 'package:project_danso/widgets/widgets.dart';

class DansoSoundLearningController extends GetxController {
  List<double> dansoPitchAdjustList = [];
  bool soundTuningState = false;
  bool listenTuningState = false;
  bool playTuningState = false;
  // late PitchModel pitchModel;
  String tuningButtonText = '기준음 잡기';
  String buttonListen = '예시듣기';
  String buttonPlay = '불어보기';
  int soundListUpDown = 0;
  List hanJaAndGel = [
    YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin),
    YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin),
    YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin),
    YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin),
    YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin),
    YulmyeongNote(Yulmyeong.joong, ScaleStatus.high),
    YulmyeongNote(Yulmyeong.yim, ScaleStatus.high),
    YulmyeongNote(Yulmyeong.moo, ScaleStatus.high),
    YulmyeongNote(Yulmyeong.hwang, ScaleStatus.high),
    YulmyeongNote(Yulmyeong.tae, ScaleStatus.high),
  ];
  double pitchValue = 0;

  //디텍터
  PitchModelInterface pitchModelInterface = PitchModel();
  // late Pitchdetector detector;
  JungGanBoPlayer jungGanBoPlayer = JungGanBoPlayer();
  late double pitch;
  bool isRecording = false;
  bool isAdjust = false;
  late String yulmyeong;
  late String pitchStatus;
  double userInputForAdjust = F_FREQ;
  final _audioRecorder = FlutterAudioCapture();
  final pitchDetectorDart = PitchDetector(44100, 2000);
  final pitchupDart = PitchHandler(InstrumentType.guitar);
  var note = "";
  var status = "Click on start";
  var isCapture = false;

  var dbFr;
  // late Pitchdetector detectorAdjust;
  Text isMacthing = Text('단소를불러보세요');

  @override
  void onInit() {
    super.onInit();
  }

  void isRecordstate() {
    isRecording = !isRecording;
    update();
  }

  Future<void> startCapture() async {
    isCapture = true;
    await _audioRecorder.start(listener, onError,
        sampleRate: 44100, bufferSize: 3000);
    note = "";
    status = "Play something";
    update();
  }

  Future<void> stopCapture() async {
    await _audioRecorder.stop();
    isCapture = false;

    note = "";
    status = "Click on start";
    update();
  }

  void listener(dynamic obj) {
    //Gets the audio sample
    var buffer = Float64List.fromList(obj.cast<double>());
    final List<double> audioSample = buffer.toList();
    //Uses pitch_detector_dart library to detect a pitch from the audio sample
    final result = pitchDetectorDart.getPitch(audioSample);
    //If there is a pitch - evaluate it
    if (result.pitched) {
      //Uses the pitchupDart library to check a given pitch for a Guitar
      final handledPitchResult = pitchupDart.handlePitch(result.pitch);
      //Updates the state with the result
      userInputForAdjust = result.pitch;
      dansoPitchAdjustList.add(userInputForAdjust);
      pitchValue = result.pitch;
      note = handledPitchResult.note;
      pitch = handledPitchResult.expectedFrequency;
      status = handledPitchResult.tuningStatus.toString();
      update();
    }
  }

  void onError(Object e) {
    print(e);
  }

  void palySound() {
    switch (soundListUpDown) {
      case 0:
        jungGanBoPlayer.playOneNoteDurationTime(
            YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin), 2000);
        break;
      case 1:
        jungGanBoPlayer.playOneNoteDurationTime(
            YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin), 2000);
        break;
      case 2:
        jungGanBoPlayer.playOneNoteDurationTime(
            YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin), 2000);
        break;
      case 3:
        jungGanBoPlayer.playOneNoteDurationTime(
            YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin), 2000);
        break;
      case 4:
        jungGanBoPlayer.playOneNoteDurationTime(
            YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin), 2000);
        break;
      case 5:
        jungGanBoPlayer.playOneNoteDurationTime(
            YulmyeongNote(Yulmyeong.joong, ScaleStatus.high), 2000);
        break;
      case 6:
        jungGanBoPlayer.playOneNoteDurationTime(
            YulmyeongNote(Yulmyeong.yim, ScaleStatus.high), 2000);
        break;
      case 7:
        jungGanBoPlayer.playOneNoteDurationTime(
            YulmyeongNote(Yulmyeong.moo, ScaleStatus.high), 2000);
        break;
      case 8:
        jungGanBoPlayer.playOneNoteDurationTime(
            YulmyeongNote(Yulmyeong.hwang, ScaleStatus.high), 2000);
        break;
      case 9:
        jungGanBoPlayer.playOneNoteDurationTime(
            YulmyeongNote(Yulmyeong.tae, ScaleStatus.high), 2000);
        break;
      default:
    }
  }

  void changeSoundTuningState() {
    soundTuningState = !soundTuningState;
    tuningButtonText = soundTuningState ? '종료하기' : '기준음 잡기';
    update();
  }

  void changePlayState() {
    playTuningState = !playTuningState;
    buttonPlay = playTuningState ? '종료하기' : '불어보기';
    update();
  }

  void changeSpeakTuningState() {
    listenTuningState = !listenTuningState;
    buttonListen = listenTuningState ? '종료하기' : '예시듣기';

    update();
  }

  // bool isCorrectPitch(
  //     {required Yulmyeong yulmyeong, bool isHighPitch = false}) {
  //   var pitch = isHighPitch ? ScaleStatus.high : ScaleStatus.origin;
  //   getDbFr();
  //   var result = pitchModelInterface.isCorrectPitch(
  //       dbFr, YulmyeongNote(yulmyeong, pitch));
  //   return result;
  // }

  void soundListUp() {
    if (soundListUpDown < hanJaAndGel.length - 1) {
      soundListUpDown++;
    }
    update();
  }

  void soundListDown() {
    if (0 < soundListUpDown) {
      soundListUpDown--;
    }
    update();
  }

  void soundListTa(int n) {
    soundListUpDown = 4;

    update();
  }

  // Widget isCorrectMethod(Yulmyeong yulmyeong, bool isHigh) {
  //   var scale = isHigh ? ScaleStatus.high : ScaleStatus.origin;
  //   // getDbFr();
  //   try {
  //     if (pitchModelInterface.isCorrectPitch(
  //         userInputForAdjust, YulmyeongNote(yulmyeong, scale))) {
  //       return Text(
  //         '잘 불렀어요!! $userInputForAdjust',
  //         style: TextStyle(color: matchColor),
  //       );
  //     } else {
  //       return Text(
  //         '음이 달라요ㅠㅠ $userInputForAdjust',
  //         style: TextStyle(color: unMatchColor),
  //       );
  //     }
  //   } catch (er) {
  //     return Text('error');
  //   }
  // }

  // Widget soundMatch() {
  //   switch (soundListUpDown) {
  //     case 0:
  //       isCorrectMethod(Yulmyeong.joong, false);
  //       break;
  //     case 1:
  //       isCorrectMethod(Yulmyeong.yim, false);
  //       break;
  //     case 2:
  //       isCorrectMethod(Yulmyeong.moo, false);
  //       break;
  //     case 3:
  //       isCorrectMethod(Yulmyeong.hwang, false);
  //       break;
  //     case 4:
  //       isCorrectMethod(Yulmyeong.tae, false);
  //       break;
  //     case 5:
  //       isCorrectMethod(Yulmyeong.joong, true);
  //       break;
  //     case 6:
  //       isCorrectMethod(Yulmyeong.yim, true);
  //       break;
  //     case 7:
  //       isCorrectMethod(Yulmyeong.moo, true);
  //       break;
  //     case 8:
  //       isCorrectMethod(Yulmyeong.hwang, true);
  //       break;
  //     case 9:
  //       isCorrectMethod(Yulmyeong.tae, true);
  //       break;
  //     default:
  //   }
  // }

  Text? soundMatch(double scl) {
    switch (soundListUpDown) {
      case 0:
        try {
          if (scl > 2000 || scl < 300) {
            return Text("단소를 불러보세요");
          } else {
            if (pitchModelInterface.isCorrectPitch(
                scl, YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin))!) {
              return Text(
                "잘 불렀어요!!",
                style: TextStyle(color: matchColor),
              );
            } else {
              return Text("다시 불러보세요!",
                  style: TextStyle(
                    color: unMatchColor,
                  ));
            }
          }
        } catch (er) {
          return Text("단소를불러보세요");
        }
        break;
      case 1:
        try {
          if (scl > 2000 || scl < 300) {
            return Text("단소를불러보세요");
          } else {
            if (pitchModelInterface.isCorrectPitch(
                scl, YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin))!) {
              return Text(
                "잘 불렀어요!!",
                style: TextStyle(color: matchColor),
              );
            } else {
              return Text("다시 불러보세요!",
                  style: TextStyle(
                    color: unMatchColor,
                  ));
            }
          }
        } catch (er) {
          return Text("단소를불러보세요");
        }
        break;
      case 2:
        try {
          if (scl > 2000 || scl < 300) {
            return Text("단소를불러보세요");
          } else {
            if (pitchModelInterface.isCorrectPitch(
                scl, YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin))!) {
              return Text(
                "잘 불렀어요!!",
                style: TextStyle(color: matchColor),
              );
            } else {
              return Text("다시 불러보세요!",
                  style: TextStyle(
                    color: unMatchColor,
                  ));
            }
          }
        } catch (er) {
          return Text("단소를불러보세요");
        }
        break;
      case 3:
        try {
          if (scl > 2000 || scl < 300) {
            return Text("단소를불러보세요");
          } else {
            if (pitchModelInterface.isCorrectPitch(
                scl, YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin))!) {
              return Text(
                "잘 불렀어요!!",
                style: TextStyle(color: matchColor),
              );
            } else {
              return Text("다시 불러보세요!",
                  style: TextStyle(
                    color: unMatchColor,
                  ));
            }
          }
        } catch (er) {
          return Text("단소를불러보세요");
        }
        break;
      case 4:
        try {
          if (scl > 2000 || scl < 300) {
            return Text("단소를불러보세요");
          } else {
            if (pitchModelInterface.isCorrectPitch(
                scl, YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin))!) {
              return Text(
                "잘 불렀어요!!",
                style: TextStyle(color: matchColor),
              );
            } else {
              return Text("다시 불러보세요!",
                  style: TextStyle(
                    color: unMatchColor,
                  ));
            }
          }
        } catch (er) {
          return Text("단소를불러보세요");
        }
        break;
      case 5:
        try {
          if (scl > 2000 || scl < 300) {
            return Text("단소를불러보세요");
          } else {
            if (pitchModelInterface.isCorrectPitch(
                scl, YulmyeongNote(Yulmyeong.joong, ScaleStatus.high))!) {
              return Text(
                "잘 불렀어요!!",
                style: TextStyle(color: matchColor),
              );
            } else {
              return Text("다시 불러보세요!",
                  style: TextStyle(
                    color: unMatchColor,
                  ));
            }
          }
        } catch (er) {
          return Text("단소를불러보세요");
        }
        break;
      case 6:
        try {
          if (scl > 2000 || scl < 300) {
            return Text("단소를불러보세요");
          } else {
            if (pitchModelInterface.isCorrectPitch(
                scl, YulmyeongNote(Yulmyeong.yim, ScaleStatus.high))!) {
              return Text(
                "잘 불렀어요!!",
                style: TextStyle(color: matchColor),
              );
            } else {
              return Text("다시 불러보세요!",
                  style: TextStyle(
                    color: unMatchColor,
                  ));
            }
          }
        } catch (er) {
          return Text("단소를불러보세요");
        }
        break;
      case 7:
        try {
          if (scl > 2000 || scl < 300) {
            return Text("단소를불러보세요");
          } else {
            if (pitchModelInterface.isCorrectPitch(
                scl, YulmyeongNote(Yulmyeong.moo, ScaleStatus.high))!) {
              return Text(
                "잘 불렀어요!!",
                style: TextStyle(color: matchColor),
              );
            } else {
              return Text("다시 불러보세요!",
                  style: TextStyle(
                    color: unMatchColor,
                  ));
            }
          }
        } catch (er) {
          return Text("단소를불러보세요");
        }
        break;
      case 8:
        try {
          if (scl > 2000 || scl < 300) {
            return Text("단소를불러보세요");
          } else {
            if (pitchModelInterface.isCorrectPitch(
                scl, YulmyeongNote(Yulmyeong.hwang, ScaleStatus.high))!) {
              return Text(
                "잘 불렀어요!!",
                style: TextStyle(color: matchColor),
              );
            } else {
              return Text("다시 불러보세요!",
                  style: TextStyle(
                    color: unMatchColor,
                  ));
            }
          }
        } catch (er) {
          return Text("단소를불러보세요");
        }
        break;
      case 9:
        try {
          if (scl > 2000 || scl < 300) {
            return Text("단소를불러보세요");
          } else {
            if (pitchModelInterface.isCorrectPitch(
                scl, YulmyeongNote(Yulmyeong.tae, ScaleStatus.high))!) {
              return Text(
                "잘 불렀어요!!",
                style: TextStyle(color: matchColor),
              );
            } else {
              return Text("다시 불러보세요!",
                  style: TextStyle(
                    color: unMatchColor,
                  ));
            }
          }
        } catch (er) {
          return Text("단소를불러보세요");
        }
        break;
      default:
    }
  }

  void getDbFr() async {
    dbFr = await DBHelPer().getUserFr();
    print(dbFr);
  }

  void startAdjust() async {
    await startCapture();
    if (isCapture) {
      isAdjust = true;
      dansoPitchAdjustList.clear();
      print('듣기 시작');
      update();
    }
    update();
  }

  void stopAdjust() async {
    // detector.stopRecording();
    isAdjust = false;
    var pitchResult;
    print('듣기 종료');

    if (dansoPitchAdjustList.isEmpty) {
      print('pitchResult : $pitchResult');
      print('pitch list isEmpty');
      await Get.dialog(testDialog(FAIL_SVG, '다시 시도 해주세요'));
    } else {
      print('pitch list isNotEmpty');

      pitchResult =
          pitchModelInterface.getModerateAverageFrequencyByListOfPitches(
                  dansoPitchAdjustList) ??
              100;
      print(dansoPitchAdjustList);

      if (pitchResult > 700.0 || pitchResult < 400.0) {
        // showToast(message: '음이 올바르지 않습니다.\n다시 시도해주세요.');
        print('음이 높거나 낮음');
        await Get.dialog(testDialog(FAIL_SVG, '실패하였습니다. 다시 시도해주세요.'));
      } else if (pitchResult < 700.0 || pitchResult > 400.0) {
        print('pitch 정상범위');
        pitchModelInterface.settingAdjust(pitchResult);
        await DBHelPer().deleteFr();
        await DBHelPer().insertFr(UserModel(standardFr: pitchResult));
        // showToast(message: '$pitchResult DB에 저장됨.');
        await Get.dialog(testDialog(SUCCESS_SVG, '성공하였습니다.'));
        update();
      } else {
        await Get.dialog(testDialog(FAIL_SVG, '실패하였습니다. 다시 시도해주세요.'));
      }
    }
    // await getDbFr();

    update();
  }
}
