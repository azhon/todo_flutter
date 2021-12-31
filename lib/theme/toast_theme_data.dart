import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastThemeData with Diagnosticable {
  final double? fontSize;
  final Color? backgroundColor;
  final Color? textColor;
  final Toast toastLength;
  final ToastGravity gravity;

  const ToastThemeData({
    this.fontSize,
    this.backgroundColor,
    this.textColor,
    this.toastLength = Toast.LENGTH_SHORT,
    this.gravity = ToastGravity.CENTER,
  });
}
