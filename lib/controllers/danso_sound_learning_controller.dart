import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:get/get.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';
import 'package:pitchupdart/instrument_type.dart';
import 'package:pitchupdart/pitch_handler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/db/db.dart';
import 'package:project_danso/models/models.dart';
import 'package:project_danso/utils/danso_function.dart';
import 'package:project_danso/utils/model/pitch_model/PitchModel.dart';
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
  var pitchValue = 0.0;
  var pitchResult = 0.0.obs;

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

  var isCapture = false;

  var dbFr;
  // late Pitchdetector detectorAdjust;
  Text isMacthing = Text('단소를 불러보세요');

  void isRecordstate() {
    isRecording = !isRecording;
    update();
  }

  void disposeFunction() {
    soundTuningState = false;
    listenTuningState = false;
    playTuningState = false;
    tuningButtonText = '기준음 잡기';
    buttonListen = '예시듣기';
    buttonPlay = '불어보기';
    if (isRecording) {
      stopCapture();
    }
  }

  Future<void> startCapture() async {
    isCapture = true;
    await _audioRecorder.start(listener, onError,
        sampleRate: 44100, bufferSize: 3000);
    update();
  }

  Future<void> stopCapture() async {
    await _audioRecorder.stop();
    isCapture = false;
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
      userInputForAdjust = result.pitch;
      dansoPitchAdjustList.add(userInputForAdjust);
      pitchValue = result.pitch;

      pitch = handledPitchResult.expectedFrequency;

      update();
    }
  }

  void onError(Object e) {
    print(e);
  }

  void playYulmyeongSound() {
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

  Text? getPitchCorrectTextWidget(double scl) {
    switch (soundListUpDown) {
      case 0:
        return buildPitchCorrectTextWidget(
            scl, YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin));
      case 1:
        return buildPitchCorrectTextWidget(
            scl, YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin));
      case 2:
        return buildPitchCorrectTextWidget(
            scl, YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin));
      case 3:
        return buildPitchCorrectTextWidget(
            scl, YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin));
      case 4:
        return buildPitchCorrectTextWidget(
            scl, YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin));
      case 5:
        return buildPitchCorrectTextWidget(
            scl, YulmyeongNote(Yulmyeong.joong, ScaleStatus.high));
      case 6:
        return buildPitchCorrectTextWidget(
            scl, YulmyeongNote(Yulmyeong.yim, ScaleStatus.high));
      case 7:
        return buildPitchCorrectTextWidget(
            scl, YulmyeongNote(Yulmyeong.moo, ScaleStatus.high));
      case 8:
        return buildPitchCorrectTextWidget(
            scl, YulmyeongNote(Yulmyeong.hwang, ScaleStatus.high));
      case 9:
        return buildPitchCorrectTextWidget(
            scl, YulmyeongNote(Yulmyeong.tae, ScaleStatus.high));
      default:
    }
  }

  Text buildPitchCorrectTextWidget(double scl, var yulmyeong) {
    try {
      if (scl > 2000 || scl < 300) {
        return Text('단소를 불러보세요',
            style: TextStyle(
              fontSize: 14.sp,
            ));
      } else {
        if (pitchModelInterface.isCorrectPitch(scl, yulmyeong)!) {
          return Text(
            '잘 불렀어요!!',
            style: TextStyle(
                color: MctColor.dansoCodematchColor.getMctColor,
                fontSize: 14.sp),
          );
        } else {
          return Text('다시 불러보세요!',
              style: TextStyle(
                fontSize: 14.sp,
                color: MctColor.dansoCodeunMatchColor.getMctColor,
              ));
        }
      }
    } catch (er) {
      return Text('단소를 불러보세요', style: TextStyle(fontSize: 14.sp));
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
      await Get.dialog(confirmCancelDialog(FAIL_SVG, '다시 시도해주세요'));
      await stopCapture();
    } else {
      print('pitch list isNotEmpty');

      pitchResult =
          pitchModelInterface.getModerateAverageFrequencyByListOfPitches(
                  dansoPitchAdjustList) ??
              100;
      print(dansoPitchAdjustList);

      if (pitchResult > 800.0 || pitchResult < 400.0) {
        // showToast(message: '음이 올바르지 않습니다.\n다시 시도해주세요.');
        print('음이 높거나 낮음');
        await Get.dialog(confirmCancelDialog(FAIL_SVG, '실패하였습니다. 다시 시도해주세요.'));
      } else if (pitchResult < 800.0 || pitchResult > 400.0) {
        print('pitch 정상범위');
        pitchModelInterface.settingAdjust(pitchResult);
        await DBHelPer().deleteFr();
        await DBHelPer().insertFr(UserModel(standardFr: pitchResult));
        // showToast(message: '$pitchResult DB에 저장됨.');
        await stopCapture();
        await Get.dialog(confirmCancelDialog(SUCCESS_SVG, '성공하였습니다.'));

        update();
      } else {
        await Get.dialog(confirmCancelDialog(FAIL_SVG, '실패하였습니다. 다시 시도해주세요.'));
        await stopCapture();
      }
    }
    // await getDbFr();

    update();
  }
}
