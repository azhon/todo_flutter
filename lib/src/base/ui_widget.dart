/// createTime: 2021/9/17 on 21:43
/// desc:
///
/// @author azhon
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/src/base/ui_adapter.dart';

mixin UIWidget implements UIAdapter {
  ///所有方向边距
  EdgeInsets all(double value) {
    return EdgeInsets.all(setWidth(value));
  }

  ///水平、竖直方向边距
  EdgeInsets symmetric(double vertical, double horizontal) {
    return EdgeInsets.symmetric(
      vertical: setWidth(vertical),
      horizontal: setWidth(horizontal),
    );
  }

  ///指定方向边距
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

  ///间距
  SizedBox sizedBox({double width = 0, double height = 0}) {
    return SizedBox(width: setWidth(width), height: setWidth(height));
  }
}
