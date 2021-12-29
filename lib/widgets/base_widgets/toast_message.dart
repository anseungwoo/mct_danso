import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({String? message}) {
  //토스트 메세지를 보여줌
  Fluttertoast.showToast(
      msg: '$message',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0);
}
