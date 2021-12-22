import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  void permission() async {
    await [
      Permission.microphone,
      Permission.camera,
      Permission.photos,
      Permission.storage
    ].request();
  }
}
