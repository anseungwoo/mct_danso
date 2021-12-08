import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/controllers/camera_record/camera_record_controller.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/widgets/widgets.dart';

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
  IndexManager indexManager = IndexManager();
  // @override
  // void initState() {
  //   _controller =
  //       CameraController(cameras[_cameraIndex], ResolutionPreset.medium);
  //   _initializeControllerFuture = _controller.initialize();

  //   super.initState();
  // }

  @override
  void dispose() {
    if (cameraRecordcontroller.isRecording) {
      cameraRecordcontroller.onStop();
      widget.controller.allMidiStop();
      indexManager.stopIndex();
    }

    if (cameraRecordcontroller.isRecording == false) {
      cameraRecordcontroller.getBack();
    }
    super.dispose();
  }

  Widget _buildCamera({required CameraRecordController caController}) {
    if (cameraRecordcontroller.controller == null ||
        !cameraRecordcontroller.controller.value.isInitialized) {
      return Center(child: Text('Loading...'));
    } else {
      return Container(
        height: 50.h,
        width: 111.w,
        child: Center(
          child: AspectRatio(
            // aspectRatio: cameraRecordcontroller.controller.value.aspectRatio,
            aspectRatio: 6 / 4,
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
            Container(
              width: 81.w,
              height: 30.h,
              child: ElevatedButton(
                child: Text(caController.recordingText,
                    style: TextStyle(fontSize: textSmallSize.sp)),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: white,
                    onPrimary: buttonColorOrang,
                    side: BorderSide(color: buttonColorOrang),
                    textStyle:
                        TextStyle(fontSize: 12.sp, color: buttonColorOrang)),
                onPressed: () async {
                  caController.isRecordingState();

                  widget.controller.changeStartStopState();
                  if (widget.controller.startStopState) {
                    await Get.dialog(
                      Dialog(
                          backgroundColor: Colors.white.withOpacity(0),
                          elevation: 0,
                          child: GameTimerWidget()),
                      barrierDismissible: false,
                    );
                    widget.controller.jandanPlay();
                    caController.onRecord();
                    widget.controller.stepStart();
                    widget.controller.playJungGanBo(indexManager);

                    widget.controller.audioSessionConfigure();
                  }
                  if (widget.controller.startStopState == false) {
                    widget.controller.jandanStop();
                    caController.onStop();
                    caController.getBack();

                    widget.controller.stepStop();
                    indexManager.stopIndex();
                  }
                },
              ),
            ),
            SizedBox(width: 5.w),
            Container(
              width: 78.w,
              height: 30.h,
              child: ElevatedButton(
                child:
                    Text('반주만', style: TextStyle(fontSize: textSmallSize.sp)),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: white,
                    onPrimary: buttonColorOrang,
                    side: BorderSide(color: buttonColorOrang),
                    textStyle:
                        TextStyle(fontSize: 12.sp, color: buttonColorOrang)),
                onPressed: () {},
              ),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Text(
          widget.jandan,
          style: TextStyle(fontSize: textSmallSize.sp),
        ),
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
