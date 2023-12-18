import 'package:flutter/material.dart';

class ShowCommonSnackBar {
  static void showMessage(context, String message,
      {Duration duration = const Duration(seconds: 1)}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: duration,
    ));
  }
}
