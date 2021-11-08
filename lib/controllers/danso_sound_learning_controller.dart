import 'package:danso_function/danso_function.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:pitchdetector/pitchdetector.dart';
import 'package:project_danso/common/const.dart';

class DansoSoundLearningController extends GetxController {
  bool soundTuningState = false;
  bool listenTunungState = false;
  bool playTunungState = false;
  PitchModel pitchModel;
  String buttonSound = '기준음 잡기';
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
  PitchModelInterface pitchModelInterface = new PitchModel();
  Pitchdetector detector;
  JungGanBoPlayer jungGanBoPlayer = new JungGanBoPlayer();
  double pitch;
  bool isRecording = false;
  bool isAdjust = false;
  Pitchdetector detectorAdjust;
  String yulmyeong;
  String pitchStatus;
  Text isMacthing = Text("");
  double userInputForAdjust;
  @override
  void onInit() {
    detector = new Pitchdetector(sampleRate: 44100, sampleSize: 4096);
    isRecording = isRecording;

    detector.onRecorderStateChanged.listen((event) {
      pitch = event["pitch"];
      yulmyeong = EnumToString.convertToString(
          pitchModelInterface.getYulmyeongByFrequency(pitch).yulmyeong);
      pitchStatus = EnumToString.convertToString(
          pitchModelInterface.getYulmyeongByFrequency(pitch).scaleStatus);

      update();
    });
    detectorAdjust = new Pitchdetector(sampleRate: 44100, sampleSize: 4096);
    detectorAdjust.onRecorderStateChanged.listen((event) {
      userInputForAdjust = event["pitch"];
      update();
    });
    super.onInit();
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
    buttonSound = soundTuningState ? '종료하기' : '기준음 잡기';
    update();
  }

  void changePlayState() {
    playTunungState = !playTunungState;
    buttonPlay = playTunungState ? '종료하기' : '불어보기';
    update();
  }

  void changeSpeakTuningState() {
    listenTunungState = !listenTunungState;
    buttonListen = listenTunungState ? '종료하기' : '예시듣기';

    update();
  }

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

  Widget soundMatch(double scl) {
    switch (soundListUpDown) {
      case 0:
        try {
          if (pitchModelInterface.isCorrectPitch(
              scl, YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin))) {
            return Text(
              "음과 일치합니다",
              style: TextStyle(color: matchColor),
            );
          } else {
            return Center(child: Text("불어 보세요"));
          }
        } catch (er) {
          return Text("");
        }
        break;
      case 1:
        try {
          if (pitchModelInterface.isCorrectPitch(
              pitch, YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin))) {
            return Text(
              "음과 일치합니다",
              style: TextStyle(color: matchColor),
            );
          } else {
            return Text("불어 보세요");
          }
        } catch (er) {
          return Text("");
        }
        break;
      case 2:
        try {
          if (pitchModelInterface.isCorrectPitch(
              scl, YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin))) {
            return Text(
              "음과 일치합니다",
              style: TextStyle(color: matchColor),
            );
          } else {
            return Text("불어 보세요");
          }
        } catch (er) {
          return Text("");
        }
        break;
      case 3:
        try {
          if (pitchModelInterface.isCorrectPitch(
              scl, YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin))) {
            return Text(
              "음과 일치합니다",
              style: TextStyle(color: matchColor),
            );
          } else {
            return Text("불어 보세요");
          }
        } catch (er) {
          return Text("");
        }
        break;
      case 4:
        try {
          if (pitchModelInterface.isCorrectPitch(
              scl, YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin))) {
            return Text(
              "음과 일치합니다",
              style: TextStyle(color: matchColor),
            );
          } else {
            return Text("불어 보세요");
          }
        } catch (er) {
          return Text("");
        }
        break;
      case 5:
        try {
          if (pitchModelInterface.isCorrectPitch(
              scl, YulmyeongNote(Yulmyeong.joong, ScaleStatus.high))) {
            return Text(
              "음과 일치합니다",
              style: TextStyle(color: matchColor),
            );
          } else {
            return Text("불어 보세요");
          }
        } catch (er) {
          return Text("");
        }
        break;
      case 6:
        try {
          if (pitchModelInterface.isCorrectPitch(
              scl, YulmyeongNote(Yulmyeong.yim, ScaleStatus.high))) {
            return Text(
              "음과 일치합니다",
              style: TextStyle(color: matchColor),
            );
          } else {
            return Text("불어 보세요");
          }
        } catch (er) {
          return Text("");
        }
        break;
      case 7:
        try {
          if (pitchModelInterface.isCorrectPitch(
              scl, YulmyeongNote(Yulmyeong.moo, ScaleStatus.high))) {
            return Text(
              "음과 일치합니다",
              style: TextStyle(color: matchColor),
            );
          } else {
            return Text("불어 보세요");
          }
        } catch (er) {
          return Text("");
        }
        break;
      case 8:
        try {
          if (pitchModelInterface.isCorrectPitch(
              scl, YulmyeongNote(Yulmyeong.hwang, ScaleStatus.high))) {
            return Text(
              "음과 일치합니다",
              style: TextStyle(color: matchColor),
            );
          } else {
            return Text("불어 보세요");
          }
        } catch (er) {
          return Text("");
        }
        break;
      case 9:
        try {
          if (pitchModelInterface.isCorrectPitch(
              scl, YulmyeongNote(Yulmyeong.tae, ScaleStatus.high))) {
            return Text(
              "음과 일치합니다",
              style: TextStyle(color: matchColor),
            );
          } else {
            return Text("불어 보세요");
          }
        } catch (er) {
          return Text("");
        }
        break;
      default:
    }
  }

  void startAdjust() async {
    await detectorAdjust.startRecording();
    if (detectorAdjust.isRecording) {
      isAdjust = true;
    }
    update();
  }

  void stopAdjust() {
    detector.stopRecording();
    isAdjust = false;
    pitchModelInterface.settingAdjust(userInputForAdjust);
    update();
  }

  void startRecording() async {
    await detector.startRecording();
    if (detector.isRecording) {
      isRecording = true;
    }

    update();
  }

  void stopRecording() async {
    detector.stopRecording();

    isRecording = false;
    pitch = detector.pitch;

    update();
  }
}
