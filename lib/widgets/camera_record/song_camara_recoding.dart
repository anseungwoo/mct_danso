import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_danso/common/common.dart';
import 'package:project_danso/controllers/controllers.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_danso/widgets/widgets.dart';

class SongCamaraRecoding extends StatefulWidget {
  final JungganboController controller;
  final songId;
  final String jandan;
  SongCamaraRecoding(
      {Key? key,
      required this.controller,
      required this.jandan,
      required this.songId})
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
      cameraRecordcontroller.onStop(songId: widget.songId);
      // widget.controller.allMidiStop();
      indexManager.stopIndex();
      widget.controller.jandanStop();
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
                    style: TextStyle(fontSize: MctSize.twelve.getSize.sp)),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: MctColor.white.getMctColor,
                    onPrimary: MctColor.buttonColorOrange.getMctColor,
                    side: BorderSide(
                        color: MctColor.buttonColorOrange.getMctColor),
                    textStyle: TextStyle(
                        fontSize: 12.sp,
                        color: MctColor.buttonColorOrange.getMctColor)),
                onPressed: () async {
                  caController.isRecordingState();

                  widget.controller.changeStartStopState();
                  if (caController.isRecording) {
                    await Get.dialog(
                      Dialog(
                          backgroundColor:
                              MctColor.white.getMctColor.withOpacity(0),
                          elevation: 0,
                          child: GameTimerWidget()),
                      barrierDismissible: false,
                    );
                    await caController.onRecord();
                    widget.controller.jandanPlay();
                    widget.controller.stepStart();
                    widget.controller.isLevelPracticeState();
                    // widget.controller.playJungGanBo(indexManager);
                    //widget.controller.audioSessionConfigure();
                  }
                  if (caController.isRecording == false) {
                    await caController.onStop(songId: widget.songId);
                    widget.controller.jandanStop();
                    widget.controller.isLevelPracticeState();
                    caController.getBack();
                    widget.controller.stepStop();
                    indexManager.stopIndex();
                  }
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Text(
          widget.jandan,
          style: TextStyle(fontSize: MctSize.twelve.getSize.sp),
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
