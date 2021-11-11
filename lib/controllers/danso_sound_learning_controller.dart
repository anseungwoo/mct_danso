import 'package:danso_function/danso_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:get/get.dart';

import 'package:project_danso/common/const.dart';
import 'package:project_danso/db/db_helpers.dart';
import 'package:project_danso/models/models.dart';
import 'package:project_danso/widgets/loading_indicator.dart';
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
  List soundList = [
    '중',
    '임',
    '무',
    '황',
    '태',
    '높은 중',
    '높은 임',
    '높은 무',
    '높은 황',
    '높은 태',
  ];
  List soundList1 = ['仲', '林', '無', '潢', '汰', '㳞', '淋', '潕', '㶂', '㳲'];
  final _flutterMidi = FlutterMidi();
  //디텍터
  PitchModelInterface pitchModelInterface = PitchModel();
  // late Pitchdetector detector;
  JungGanBoPlayer jungGanBoPlayer = JungGanBoPlayer();
  late double pitch;
  bool isRecording = false;
  bool isAdjust = false;
  late String yulmyeong;
  late String pitchStatus;
  // double userInputForAdjust = F_FREQ;

  var dbFr;
  // late Pitchdetector detectorAdjust;
  Text isMacthing = Text("불러보세요");

  @override
  void onInit() {
    // detector = new Pitchdetector(sampleRate: 44100, sampleSize: 4096);
    isRecording = isRecording;
    // detectorAdjust = Pitchdetector(sampleRate: 44100, sampleSize: 4096);
    // detectorAdjust.onRecorderStateChanged.listen((event) {
    //   // pitch = event['pitch'];
    //   if (pitch > 150) {
    //     // userInputForAdjust = event['pitch'];
    //     print(userInputForAdjust);
    //     dansoPitchAdjustList!.add(userInputForAdjust);
    //     update();
    //   }
    // });
    super.onInit();
  }

  Future delayDialog() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    await Get.dialog(Dialog(
      child: LoadingIndicator(),
    ));
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
    if (soundListUpDown < soundList.length - 1) {
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
  //         '음과 일치합니다. $userInputForAdjust',
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

  // Text? soundMatch(double scl) {
  //   switch (soundListUpDown) {
  //     case 0:
  //       try {
  //         if (scl > 2000 || scl < 300) {
  //           return Text("불러보세요");
  //         } else {
  //           if (pitchModelInterface.isCorrectPitch(
  //               scl, YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin))) {
  //             return Text(
  //               "음과 일치합니다.",
  //               style: TextStyle(color: matchColor),
  //             );
  //           } else {
  //             return Text("음이 다릅니다.",
  //                 style: TextStyle(
  //                   color: unMatchColor,
  //                 ));
  //           }
  //         }
  //       } catch (er) {
  //         return Text("불러보세요");
  //       }
  //       break;
  //     case 1:
  //       try {
  //         if (scl > 2000 || scl < 300) {
  //           return Text("불러보세요");
  //         } else {
  //           if (pitchModelInterface.isCorrectPitch(
  //               scl, YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin))) {
  //             return Text(
  //               "음과 일치합니다.",
  //               style: TextStyle(color: matchColor),
  //             );
  //           } else {
  //             return Text("음이 다릅니다.",
  //                 style: TextStyle(
  //                   color: unMatchColor,
  //                 ));
  //           }
  //         }
  //       } catch (er) {
  //         return Text("불러보세요");
  //       }
  //       break;
  //     case 2:
  //       try {
  //         if (scl > 2000 || scl < 300) {
  //           return Text("불러보세요");
  //         } else {
  //           if (pitchModelInterface.isCorrectPitch(
  //               scl, YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin))) {
  //             return Text(
  //               "음과 일치합니다.",
  //               style: TextStyle(color: matchColor),
  //             );
  //           } else {
  //             return Text("음이 다릅니다.",
  //                 style: TextStyle(
  //                   color: unMatchColor,
  //                 ));
  //           }
  //         }
  //       } catch (er) {
  //         return Text("불러보세요");
  //       }
  //       break;
  //     case 3:
  //       try {
  //         if (scl > 2000 || scl < 300) {
  //           return Text("불러보세요");
  //         } else {
  //           if (pitchModelInterface.isCorrectPitch(
  //               scl, YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin))) {
  //             return Text(
  //               "음과 일치합니다.",
  //               style: TextStyle(color: matchColor),
  //             );
  //           } else {
  //             return Text("음이 다릅니다.",
  //                 style: TextStyle(
  //                   color: unMatchColor,
  //                 ));
  //           }
  //         }
  //       } catch (er) {
  //         return Text("불러보세요");
  //       }
  //       break;
  //     case 4:
  //       try {
  //         if (scl > 2000 || scl < 300) {
  //           return Text("불러보세요");
  //         } else {
  //           if (pitchModelInterface.isCorrectPitch(
  //               scl, YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin))) {
  //             return Text(
  //               "음과 일치합니다.",
  //               style: TextStyle(color: matchColor),
  //             );
  //           } else {
  //             return Text("음이 다릅니다.",
  //                 style: TextStyle(
  //                   color: unMatchColor,
  //                 ));
  //           }
  //         }
  //       } catch (er) {
  //         return Text("불러보세요");
  //       }
  //       break;
  //     case 5:
  //       try {
  //         if (scl > 2000 || scl < 300) {
  //           return Text("불러보세요");
  //         } else {
  //           if (pitchModelInterface.isCorrectPitch(
  //               scl, YulmyeongNote(Yulmyeong.joong, ScaleStatus.high))) {
  //             return Text(
  //               "음과 일치합니다.",
  //               style: TextStyle(color: matchColor),
  //             );
  //           } else {
  //             return Text("음이 다릅니다.",
  //                 style: TextStyle(
  //                   color: unMatchColor,
  //                 ));
  //           }
  //         }
  //       } catch (er) {
  //         return Text("불러보세요");
  //       }
  //       break;
  //     case 6:
  //       try {
  //         if (scl > 2000 || scl < 300) {
  //           return Text("불러보세요");
  //         } else {
  //           if (pitchModelInterface.isCorrectPitch(
  //               scl, YulmyeongNote(Yulmyeong.yim, ScaleStatus.high))) {
  //             return Text(
  //               "음과 일치합니다.",
  //               style: TextStyle(color: matchColor),
  //             );
  //           } else {
  //             return Text("음이 다릅니다.",
  //                 style: TextStyle(
  //                   color: unMatchColor,
  //                 ));
  //           }
  //         }
  //       } catch (er) {
  //         return Text("불러보세요");
  //       }
  //       break;
  //     case 7:
  //       try {
  //         if (scl > 2000 || scl < 300) {
  //           return Text("불러보세요");
  //         } else {
  //           if (pitchModelInterface.isCorrectPitch(
  //               scl, YulmyeongNote(Yulmyeong.moo, ScaleStatus.high))) {
  //             return Text(
  //               "음과 일치합니다.",
  //               style: TextStyle(color: matchColor),
  //             );
  //           } else {
  //             return Text("음이 다릅니다.",
  //                 style: TextStyle(
  //                   color: unMatchColor,
  //                 ));
  //           }
  //         }
  //       } catch (er) {
  //         return Text("불러보세요");
  //       }
  //       break;
  //     case 8:
  //       try {
  //         if (scl > 2000 || scl < 300) {
  //           return Text("불러보세요");
  //         } else {
  //           if (pitchModelInterface.isCorrectPitch(
  //               scl, YulmyeongNote(Yulmyeong.hwang, ScaleStatus.high))) {
  //             return Text(
  //               "음과 일치합니다.",
  //               style: TextStyle(color: matchColor),
  //             );
  //           } else {
  //             return Text("음이 다릅니다.",
  //                 style: TextStyle(
  //                   color: unMatchColor,
  //                 ));
  //           }
  //         }
  //       } catch (er) {
  //         return Text("불러보세요");
  //       }
  //       break;
  //     case 9:
  //       try {
  //         if (scl > 2000 || scl < 300) {
  //           return Text("불러보세요");
  //         } else {
  //           if (pitchModelInterface.isCorrectPitch(
  //               scl, YulmyeongNote(Yulmyeong.tae, ScaleStatus.high))) {
  //             return Text(
  //               "음과 일치합니다.",
  //               style: TextStyle(color: matchColor),
  //             );
  //           } else {
  //             return Text("음이 다릅니다.",
  //                 style: TextStyle(
  //                   color: unMatchColor,
  //                 ));
  //           }
  //         }
  //       } catch (er) {
  //         return Text("불러보세요");
  //       }
  //       break;
  //     default:
  //   }
  // }

  void getDbFr() async {
    dbFr = await DBHelPer().getUserFr();
    print(dbFr);
  }

  void startAdjust() async {
    // await detector.startRecording();
    // if (detector.isRecording) {
    //   isAdjust = true;
    //   dansoPitchAdjustList.clear();
    //   print('듣기 시작');
    //   update();
    // }
    update();
  }

  // void stopAdjust() async {
  //   // detector.stopRecording();
  //   isAdjust = false;
  //   print('듣기 종료');
  //   if (userInputForAdjust < 400 || userInputForAdjust > 900) {
  //     showToast(message: '음이 올바르지 않습니다.\n다시 시도해주세요.');
  //   } else {
  //     await DBHelPer().deleteFr();
  //     await DBHelPer().insertFr(UserModel(standardFr: userInputForAdjust));
  //     pitchModelInterface.settingAdjust(userInputForAdjust);
  //     var pitchResult = pitchModelInterface
  //         .getModerateAverageFrequencyByListOfPitches(dansoPitchAdjustList);
  //     // await getDbFr();
  //     showToast(message: '$pitchResult DB에 저장됨.');
  //     update();
  //   }
  // }

  void startRecording() async {
    // await detector.startRecording();
    // if (detector.isRecording) {
    //   isRecording = true;
    // }

    update();
  }

  void stopRecording() {
    // detector.stopRecording();
    // isRecording = false;
    // pitch = detector.pitch;

    update();
  }
}
