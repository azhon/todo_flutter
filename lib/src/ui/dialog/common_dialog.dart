import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/ui_adapter.dart';
import 'package:todo_flutter/src/base/ui_widget.dart';
import 'package:todo_flutter/src/ui/dialog/base_dialog.dart';

/// createTime: 2023/2/23 on 16:01
/// desc:
///
/// @author azhon
class CommonDialog with BaseDialog, UIWidget, UIAdapter {
  ///
  static final CommonDialog instance = CommonDialog();

  ///提示对话框
  ///return [bool] false：取消，true：确定
  Future<bool?> tipDialog(
    BuildContext context,
    String? title,
    String message, {
    bool canceledOutside = true,
    String confirmText = '确定',
    Color confirmColor = Colors.blue,
    String cancelText = '取消',
    Color cancelColor = const Color(0xFF666666),
  }) {
    return baseDialog(
      context,
      title: title,
      message: message,
      canceledOutside: canceledOutside,
      confirmText: confirmText,
      confirmColor: confirmColor,
      cancelText: cancelText,
      cancelColor: cancelColor,
    );
  }

  ///只显示一个按钮
  ///return [bool] true：确定
  Future<bool?> singleButtonDialog(
    BuildContext context,
    String? title,
    String message, {
    bool canceledOutside = true,
    String confirmText = '确定',
    Color confirmColor = Colors.blue,
  }) {
    return baseDialog(
      context,
      title: title,
      message: message,
      singleButton: true,
      canceledOutside: canceledOutside,
      confirmText: confirmText,
      confirmColor: confirmColor,
    );
  }

  ///输入框对话框
  ///return [String] 文本框内容
  Future<String?> inputDialog(
    BuildContext context,
    String? title, {
    String placeholder = '',
    bool canceledOutside = true,
    bool obscureText = false,
    String confirmText = '确定',
    Color confirmColor = Colors.blue,
    String cancelText = '取消',
    Color cancelColor = const Color(0xFF666666),
  }) {
    return baseInputDialog(
      context,
      title: title,
      placeholder: placeholder,
      canceledOutside: canceledOutside,
      obscureText: obscureText,
      confirmText: confirmText,
      confirmColor: confirmColor,
      cancelText: cancelText,
      cancelColor: cancelColor,
    );
  }
}
