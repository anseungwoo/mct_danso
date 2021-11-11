import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_danso/controllers/camera_record/camera_record_controller.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongCamaraRecoding extends StatefulWidget {
  final JungganboController controller;
  final String jandan;
  SongCamaraRecoding({Key? key, required this.controller, required this.jandan})
      : super(key: key);

  @override
  _SongCamaraRecodingState createState() => _SongCamaraRecodingState();
}

class _SongCamaraRecodingState extends State<SongCamaraRecoding> {
  final cameraRecordcontroller = Get.put(CameraRecordController());

  // @override
  // void initState() {
  //   _controller =
  //       CameraController(cameras[_cameraIndex], ResolutionPreset.medium);
  //   _initializeControllerFuture = _controller.initialize();

  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  Widget _buildCamera({required CameraRecordController caController}) {
    if (cameraRecordcontroller.controller == null ||
        !cameraRecordcontroller.controller.value.isInitialized) {
      return Center(child: Text('Loading...'));
    } else {
      return Container(
        height: 68.h,
        width: 111.w,
        child: Center(
          child: AspectRatio(
            // aspectRatio: cameraRecordcontroller.controller.value.aspectRatio,
            aspectRatio: 4 / 6,
            child: CameraPreview(cameraRecordcontroller.controller),
          ),
        ),
      );
    }
  }

  Widget _buildControls({required CameraRecordController caController}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: <Widget>[
            ElevatedButton(
                child: Text(caController.recordingText),
                onPressed: () {
                  caController.isRecordingState();
                  caController.isRecording
                      ? caController.onRecord()
                      : caController.onStop();

                  widget.controller.changeStartStopState();
                  widget.controller.starStopState
                      ? widget.controller.stepStart()
                      : widget.controller.stepStop();
                }),
            SizedBox(width: 5),
            ElevatedButton(
              child: Text('반주만'),
              onPressed: () {},
            ),
          ],
        ),
        Text(widget.jandan),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CameraRecordController>(
        init: cameraRecordcontroller,
        builder: (caController) {
          return FutureBuilder(
              future: caController.initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Row(
                    children: [
                      _buildCamera(caController: caController),
                      Spacer(flex: 1),
                      _buildControls(caController: caController),
                    ],
                  );
                } else {
                  return CircularProgressIndicator();
                }
              });
        });
  }
}
