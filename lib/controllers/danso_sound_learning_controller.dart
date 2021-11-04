import 'package:danso_function/danso_function.dart';
import 'package:get/get.dart';
import 'package:pitchdetector/pitchdetector.dart';
import 'package:project_danso/db/db_helpers.dart';
import 'package:project_danso/models/user_model.dart';
import 'package:project_danso/widgets/widgets.dart';

class DansoSoundLearningController extends GetxController {
  bool soundTuningState = false;
  bool listenTuningState = false;
  bool playTuningState = false;

  String tunningButtonText = '기준음 잡기';
  String buttonListen = '예시듣기';
  String buttonPlay = '불어보기';
  int soundListUpDown = 0;
  List soundList = ['중', '임', '무', '황', '태'];
  List soundList1 = ['仲', '林', '無', '潢', '汰'];

  PitchModelInterface pitchModelInterface = PitchModel();
  Pitchdetector detector;
  Pitchdetector detectorAdjust;
  double pitch;
  String yulmyeong;
  String pitchStatus;
  double userInputForAdjust = F_FREQ;
  bool isRecording = false;

  var dbFr;

  int listsize = 20;

  @override
  void onInit() {
    super.onInit();
    detector = Pitchdetector(sampleRate: 44100, sampleSize: 4096);
    isRecording = isRecording;
    // detector.onRecorderStateChanged.listen((event) {
    //   pitch = event['pitch'];
    //   if (pitch > 150) {
    // yulmyeong =
    //     pitchModelInterface.getYulmyeongByFrequency(pitch).toHangeul();
    // pitchStatus = pitchModelInterface
    //     .getYulmyeongByFrequency(pitch)
    //     .toChineseCharacter();
    //     update();
    //   }
    // });
    detectorAdjust = Pitchdetector(sampleRate: 44100, sampleSize: 4096);
    detectorAdjust.onRecorderStateChanged.listen((event) {
      pitch = event['pitch'];
      if (pitch > 150) {
        userInputForAdjust = event['pitch'];
        print(userInputForAdjust);
        update();
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getDbFr() async {
    dbFr = await DBHelPer().getUserFr();
    print(dbFr);
  }

  void startRecording() async {
    await detector.startRecording();
    if (detector.isRecording) {
      isRecording = true;
      print('듣기 시작');
      update();
    }
  }

  void stopRecording() async {
    detector.stopRecording();
    isRecording = false;
    print('듣기 종료');
    await DBHelPer().deleteFr();
    await DBHelPer().insertFr(UserModel(standardFr: userInputForAdjust));
    pitchModelInterface.settingAdjust(userInputForAdjust);
    await getDbFr();
    showToast(message: '$dbFr DB에 저장됨.');
    update();
  }

  void changeSoundTuningState() {
    soundTuningState = !soundTuningState;
    tunningButtonText = soundTuningState ? '종료하기' : '기준음 잡기';
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

  bool isCorrectPitch({Yulmyeong yulmyeong, bool isHighPitch = false}) {
    var pitch = isHighPitch ? ScaleStatus.high : ScaleStatus.origin;
    getDbFr();
    var result = pitchModelInterface.isCorrectPitch(
        dbFr, YulmyeongNote(yulmyeong, pitch));
    return result;
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
}
