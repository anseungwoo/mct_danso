import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  Future<bool> checkPermission() async {
    var statuses = await [
      Permission.camera,
      Permission.microphone,
      // Permission.photos,
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
