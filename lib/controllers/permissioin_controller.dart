import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  void permission() async {
    Map<Permission, PermissionStatus> permissions =
        await [Permission.camera, Permission.microphone].request();
    var micPermission = await Permission.microphone.status;
    var cameraPermission = await Permission.camera.status;
    print('per1 : ${Permission.microphone.status.isGranted}');

    if (!micPermission.isGranted || !cameraPermission.isGranted) {
      await showDialog(
        context: Get.context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text('Camera Permission'),
          content: Text('카메라 또는 마이크 권한이 허용되지 않았습니다.'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('취소'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CupertinoDialogAction(
              child: Text('설정'),
              onPressed: () => openAppSettings(),
            ),
          ],
        ),
      );
    }
  }
}
