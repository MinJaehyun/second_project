import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMsg {
  static void showToast({required String msg}) {
    Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_LONG, // Android
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1, // iOS
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}