import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  // void permission() async {
  //   await [
  //     Permission.microphone,
  //     Permission.camera,
  //     Permission.photos,
  //     Permission.storage
  //   ].request();
  // }

  Future<bool> checkPermission() async {
    var statuses = await [
      Permission.camera,
      Permission.microphone,
      Permission.photos,
      Permission.storage
    ].request();

    var per = true;

    statuses.forEach((permission, permissionStatus) {
      if (!permissionStatus.isGranted) {
        per = false; //하나라도 허용이안됐으면 false
      }
    });

    return per;
  }

  // Future<bool> requestPermission(BuildContext context) async {
  //   var cameraStatus = await Permission.camera.request();
  //   var micStatus = await Permission.camera.request();
  //   var photoStatus = await Permission.camera.request();
  //   var storageStatus = await Permission.camera.request();

  //   if (!cameraStatus.isGranted ||
  //       !micStatus.isGranted ||
  //       !photoStatus.isGranted ||
  //       !storageStatus.isGranted) {
  //     // 허용이 안된 경우
  //     await await buildPermissionDialog(context);
  //     return false;
  //   }
  //   return true;
  // }

  Future buildPermissionDialog(BuildContext context,
      {dynamic runMethod}) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              content: Text('권한 설정을 확인해주세요.'),
              actions: [
                ElevatedButton(
                    onPressed: () async {
                      await checkPermission().then((value) {
                        if (!value) {
                          buildPermissionDialog(context);
                        } else if (value) {
                          Get.back();
                          runMethod;
                        }
                      });
                    },
                    child: Text('닫기')),
                ElevatedButton(
                    onPressed: () async {
                      await openAppSettings(); // 앱 설정으로 이동
                    },
                    child: Text('설정하기')),
              ],
            ),
          );
        });
  }
}
