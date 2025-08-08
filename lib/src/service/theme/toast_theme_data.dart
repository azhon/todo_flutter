import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastThemeData with Diagnosticable {
  final Color foregroundColor;
  final Color backgroundColor;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Duration autoCloseDuration;
  final ToastCloseButton closeButton;
  final ToastificationStyle style;
  final BorderRadiusGeometry? borderRadius;
  final ToastificationAnimationBuilder? animationBuilder;

  const ToastThemeData({
    this.borderRadius,
    this.animationBuilder,
    this.style = ToastificationStyle.simple,
    this.alignment = Alignment.bottomCenter,
    this.foregroundColor = Colors.white,
    this.backgroundColor = const Color(0xFF161619),
    this.margin = const EdgeInsets.only(bottom: 50),
    this.padding = const EdgeInsets.only(
      top: 10,
      bottom: 10,
      left: 18,
      right: 10,
    ),
    this.autoCloseDuration = const Duration(milliseconds: 1500),
    this.closeButton = const ToastCloseButton(
      showType: CloseButtonShowType.none,
    ),
  });
}
