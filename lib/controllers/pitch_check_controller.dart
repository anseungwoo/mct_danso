import 'dart:typed_data';

import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:get/get.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';
import 'package:pitchupdart/instrument_type.dart';
import 'package:pitchupdart/pitch_handler.dart';
import 'package:project_danso/controllers/jungganbo_controller.dart';
import 'package:project_danso/utils/danso_function.dart';

class PitchCheckController extends GetxController {
  PitchModelInterface pitchModelInterface = PitchModel();
  late List<dynamic> matchTrueFalse;

  final _audioRecorder = FlutterAudioCapture();
  final pitchDetectorDart = PitchDetector(44100, 2000);
  final pitchupDart = PitchHandler(InstrumentType.guitar);
  final jungganboController = Get.put(JungganboController());

  double pitchValue = 0;
  List<double> pitchValueList = [];

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   create2DList();
  //   super.onInit();
  // }

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

  void create2DList() {
    matchTrueFalse = List.generate(
        jungganboController.jungGanBo!.sheet.length,
        (index) => List.filled(
            jungganboController.jungGanBo!.sheet[index].yulmyeongs.length,
            false),
        growable: false);
  }

  void checkYulmyeongsSection(int i, {dynamic pitchValue}) {
    var data = jungganboController.jungGanBo!.sheet[i];
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
}
