import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:project_danso/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongCamaraRecoding extends StatefulWidget {
  SongCamaraRecoding({Key key}) : super(key: key);

  @override
  _SongCamaraRecodingState createState() => _SongCamaraRecodingState();
}

class _SongCamaraRecodingState extends State<SongCamaraRecoding> {
  CameraController _controller;
  int _cameraIndex = 1;
  Future<void> _initializeControllerFuture;
  bool _isRecording = false;
  @override
  void initState() {
    _controller =
        CameraController(cameras[_cameraIndex], ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();

    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Widget _buildCamera() {
    if (_controller == null || !_controller.value.isInitialized) {
      return Center(child: Text('Loading...'));
    } else {
      return AspectRatio(
        // aspectRatio: _controller.value.aspectRatio,
        aspectRatio: 5 / 4,

        child: CameraPreview(_controller),
      );
    }
  }

  Widget _buildControls() {
    return Row(
      children: <Widget>[
        ElevatedButton(
          child: _isRecording ? Text("녹화중지") : Text("녹화시작"),
          onPressed: _isRecording ? _onStop : _onRecord,
        ),
        SizedBox(width: 5),
        ElevatedButton(
          child: Text("반주만"),
          onPressed: () {},
        ),
      ],
    );
  }

  Future<void> _onStop() async {
    final video = await _controller.stopVideoRecording();
    print(video);

    await GallerySaver.saveVideo(video.path);
    File(video.path).deleteSync();
    setState(() => _isRecording = false);
  }

  Future<void> _onRecord() async {
    await _controller.startVideoRecording();
    setState(() => _isRecording = true);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Row(
              children: [
                Container(width: 120.w, height: 70.h, child: _buildCamera()),
                Spacer(flex: 1),
                _buildControls(),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
