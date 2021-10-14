import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/tabbar_and_appbar.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongTitle extends StatefulWidget {
  SongTitle({Key key}) : super(key: key);

  @override
  _SongTitleState createState() => _SongTitleState();
}

class _SongTitleState extends State<SongTitle> {
  List<CameraDescription> _cameras;
  CameraController _controller;
  int _cameraIndex;
  bool _isRecording = false;
  String _filePath;

  @override
  void initState() {
    super.initState();
    availableCameras().then((cameras) {
      _cameras = cameras;
      if (_cameras.length != 0) {
        _cameraIndex = 0;
        _initCamera(_cameras[_cameraIndex]);
      }
    });
  }

  _initCamera(CameraDescription camera) async {
    if (_controller != null) await _controller.dispose();
    _controller = CameraController(camera, ResolutionPreset.medium);
    _controller.addListener(() => this.setState(() {}));
    _controller.initialize();
  }

  Widget _buildCamera() {
    if (_controller == null || !_controller.value.isInitialized)
      return Center(child: Text('Loading...'));
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: CameraPreview(_controller),
    );
  }

  Widget _buildControls() {
    return Row(
      children: <Widget>[
        ElevatedButton(
          child: Text(_getCameraText(_cameras[_cameraIndex].lensDirection)),
          onPressed: _onSwitchCamera,
        ),
        SizedBox(width: 5),
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
    await _controller.stopVideoRecording();
    setState(() => _isRecording = false);
  }

  Future<void> _onRecord() async {
    var directory = await getTemporaryDirectory();
    _filePath = directory.path + '/${DateTime.now()}.mp4';
    _controller.startVideoRecording();
    setState(() => _isRecording = true);
  }

  _getCameraText(CameraLensDirection lensDirection) {
    return lensDirection == CameraLensDirection.back ? "정면" : "후면";
  }

  void _onSwitchCamera() {
    if (_cameras.length < 2) return;
    _cameraIndex = (_cameraIndex + 1) % 2;
    _initCamera(_cameras[_cameraIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: songtabbarAndAppBar(
          title: "노래곡 제목", tabbar: null, enableTabBar: false),
      body: Padding(
        padding: const EdgeInsets.all(basicPadding),
        child: Row(children: [
          Container(
              width: 100.w, height: 70.h, child: Center(child: _buildCamera())),
          Spacer(flex: 1),
          _buildControls(),
        ]),
      ),
    );
  }
}
