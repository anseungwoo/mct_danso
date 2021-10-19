import 'dart:io' as io;
import 'package:audio_recorder/audio_recorder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/controllers/controllers.dart';

class SongAudioRecorder extends StatefulWidget {
  final LocalFileSystem localFileSystem;
  PlayAndTestController controller;
  SongAudioRecorder({localFileSystem, this.controller})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  State<StatefulWidget> createState() => new SongAudioRecorderState();
}

class SongAudioRecorderState extends State<SongAudioRecorder> {
  Recording _recording = new Recording();
  bool _isRecording = false;

  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      FlatButton(
        color: Colors.blue,
        onPressed: _isRecording ? _stop : _start,
        child: _isRecording ? Text('녹음중지') : Text("녹음 시작"),
      ),
      SizedBox(width: 5.w),
      FlatButton(
        onPressed: () {},
        child: Text("반주만"),
        color: Colors.blue,
      ),
    ]);
  }

  _start() async {
    try {
      if (await AudioRecorder.hasPermissions) {
        if (_controller.text != null && _controller.text != "") {
          String path = _controller.text;
          if (!_controller.text.contains('/')) {
            io.Directory appDocDirectory =
                await getApplicationDocumentsDirectory();
            path = appDocDirectory.path + '/' + _controller.text;
          }
          print("Start recording: $path");
          await AudioRecorder.start(
              path: path, audioOutputFormat: AudioOutputFormat.AAC);
        } else {
          await AudioRecorder.start();
        }
        bool isRecording = await AudioRecorder.isRecording;
        setState(() {
          _recording = new Recording(duration: new Duration(), path: "");
          _isRecording = isRecording;
        });
      } else {
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: new Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }

  _stop() async {
    var recording = await AudioRecorder.stop();
    print("Stop recording: ${recording.path}");
    bool isRecording = await AudioRecorder.isRecording;
    File file = widget.localFileSystem.file(recording.path);
    print("  File length: ${await file.length()}");
    setState(() {
      _recording = recording;
      _isRecording = isRecording;
    });
    _controller.text = recording.path;
    widget.controller.stateCountUp(2);
  }
}
