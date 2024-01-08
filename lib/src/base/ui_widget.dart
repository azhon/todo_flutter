/// createTime: 2021/9/17 on 21:43
/// desc:
///
/// @author azhon
import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/ui_adapter.dart';

mixin UIWidget implements UIAdapter {
  EdgeInsets all(double value) {
    return EdgeInsets.all(setWidth(value));
  }

  EdgeInsets symmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return EdgeInsets.symmetric(
      vertical: setWidth(vertical),
      horizontal: setWidth(horizontal),
    );
  }

  EdgeInsets only({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return EdgeInsets.only(
      left: setWidth(left),
      top: setWidth(top),
      right: setWidth(right),
      bottom: setWidth(bottom),
    );
  }

  SizedBox sizedBox({
    double? width,
    double? height,
    Widget? child,
  }) {
    return SizedBox(
      width: width == null ? null : setWidth(width),
      height: height == null ? null : setWidth(height),
      child: child,
    );
  }

  BorderRadius circular(double radius) {
    return BorderRadius.circular(setRadius(radius));
  }

  BorderRadius radiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return BorderRadius.only(
      topLeft: Radius.circular(setRadius(topLeft)),
      topRight: Radius.circular(setRadius(topRight)),
      bottomLeft: Radius.circular(setRadius(bottomLeft)),
      bottomRight: Radius.circular(setRadius(bottomRight)),
    );
  }
}
