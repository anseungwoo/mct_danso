import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_danso/controllers/controllers.dart';

class SongAudioRecorder extends StatefulWidget {
  PlayAndTestController controller;
  SongAudioRecorder({Key key, this.controller, PlayAndTestController contoller})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => new SongAudioRecorderState();
}

class SongAudioRecorderState extends State<SongAudioRecorder> {
  FlutterAudioRecorder _recorder;
  Recording _recording;
  Timer _time;
  Widget _buttonText = Text("녹음오류");
  String _alert;
  String delPath;
  String day;
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      _prepare();
    });
  }

  void _changeState() async {
    switch (_recording.status) {
      case RecordingStatus.Initialized:
        {
          await _startRecording();
          break;
        }
      case RecordingStatus.Recording:
        {
          await _stopRecording();
          break;
        }
      case RecordingStatus.Stopped:
        {
          await _prepare();
          break;
        }

      default:
        break;
    }

    setState(() {
      _buttonText = _buttonTextState(_recording.status);
    });
  }

  Future _init() async {
    String customPath = '/flutter_audio_recorder_';
    io.Directory appDocDirectory;
    if (io.Platform.isIOS) {
      appDocDirectory = await getApplicationDocumentsDirectory();
    } else {
      appDocDirectory = await getExternalStorageDirectory();
    }

    // can add extension like ".mp4" ".wav" ".m4a" ".aac"
    delPath = appDocDirectory.path + customPath;
    customPath = appDocDirectory.path +
        customPath +
        DateTime.now().millisecondsSinceEpoch.toString();
    day = DateTime.now().millisecondsSinceEpoch.toString();

    // .wav <---> AudioFormat.WAV
    // .mp4 .m4a .aac <---> AudioFormat.AAC
    // AudioFormat is optional, if given value, will overwrite path extension when there is conflicts.

    _recorder = FlutterAudioRecorder(customPath,
        audioFormat: AudioFormat.WAV, sampleRate: 22050);
    await _recorder.initialized;
  }

  Future _prepare() async {
    var hasPermission = await FlutterAudioRecorder.hasPermissions;
    if (hasPermission) {
      await _init();
      var result = await _recorder.current();
      setState(() {
        _recording = result;
        _buttonText = _buttonTextState(_recording.status);
        _alert = "";
      });
    } else {
      setState(() {
        _alert = "Permission Required.";
      });
    }
  }

  Future _startRecording() async {
    await _recorder.start();
    var current = await _recorder.current();
    setState(() {
      _recording = current;
    });

    _time = Timer.periodic(Duration(milliseconds: 10), (Timer t) async {
      var current = await _recorder.current();
      setState(() {
        _recording = current;
        _time = t;
      });
    });
  }

  Future _stopRecording() async {
    var result = await _recorder.stop();
    _time.cancel();

    setState(() {
      _recording = result;
    });
    widget.controller.stateCountUp(2);
  }
//  삭제기능 테스트 함수입니다.
  // Future _del() async {
  //   // AudioPlayer player = AudioPlayer();
  //   // player.play(_recording.path, isLocal: true);
  //   try {
  //     print(delPath);
  //     print(_recording.path);
  //     print(day);
  //     final _localFile = io.File('${delPath}${day}.wav');
  //     print(_localFile);
  //     final file = await _localFile;

  //     await file.delete();
  //   } catch (e) {
  //     return;
  //   }
  // }

  Widget _buttonTextState(RecordingStatus status) {
    switch (status) {
      case RecordingStatus.Initialized:
        {
          return Text("녹음시작");
        }
      case RecordingStatus.Recording:
        {
          return Text("녹음멈춤");
        }
      case RecordingStatus.Stopped:
        {
          return Text("녹화정지");
        }
      default:
        return Icon(Icons.do_not_disturb_on);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      ElevatedButton(
        onPressed: _changeState,
        child: _buttonText,
      ),
      SizedBox(width: 5.w),
      ElevatedButton(
        onPressed: () {},
        child: Text("반주만"),
      ),
    ]);

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
