import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:project_danso/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongCamaraRecoding extends StatefulWidget {
  PlayAndTestController controller;
  SongCamaraRecoding(
      {Key key, this.controller, PlayAndTestController contoller})
      : super(key: key);

  @override
  _SongCamaraRecodingState createState() => _SongCamaraRecodingState();
}

class _SongCamaraRecodingState extends State<SongCamaraRecoding> {
  CameraController _controller;
  final int _cameraIndex = 1;
  Future<void> _initializeControllerFuture;
  bool _isRecording = false;
  final size = MediaQuery.of(Get.context).size;

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
      return Container(
        height: 68.h,
        width: 111.w,
        child: Center(
          child: AspectRatio(
            // aspectRatio: _controller.value.aspectRatio,
            aspectRatio: 4 / 5,
            child: CameraPreview(_controller),
          ),
        ),
      );
    }
  }

  Widget _buildControls() {
    return Row(
      children: <Widget>[
        ElevatedButton(
          child: _isRecording ? Text('녹화중지') : Text('녹화시작'),
          onPressed: _isRecording ? _onStop : _onRecord,
        ),
        SizedBox(width: 5),
        ElevatedButton(
          child: Text('반주만'),
          onPressed: () {},
        ),
      ],
    );
  }

  Future<void> _onStop() async {
    final video = await _controller.stopVideoRecording();
    print(video);
    print(video.path);
    if (io.Platform.isIOS) {
      await GallerySaver.saveVideo(
        '${video.path}',
      );
    } else {
      await GallerySaver.saveVideo(
        video.path,
      );
    }
    // File(video.path).deleteSync(); // 이코드 주석 처리하니깐 ios에서 실행됨
    setState(() => _isRecording = false);
    widget.controller.stateCountUp(2);
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
                _buildCamera(),
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
