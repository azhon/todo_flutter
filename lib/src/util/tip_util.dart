import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:todo_flutter/src/service/theme/toast_theme_data.dart';
import 'package:todo_flutter/src/ui/dialog/loading_dialog.dart';
import 'package:todo_flutter/src/util/object_util.dart';
import 'package:todo_flutter/todo_lib.dart';

/// createTime: 2023/4/14 on 20:38
/// desc:
///
/// @author azhon

///显示toast
void showToast(String msg, {ToastThemeData? data}) {
  if (ObjectUtil.isEmpty(msg)) {
    return;
  }
  final ToastThemeData theme =
      data ?? TodoLib.of(TodoLib.navigatorKey.currentContext!).toastThemeData;
  cancelToast();
  toastification.show(
    title: Text(msg),
    style: theme.style,
    alignment: theme.alignment,
    foregroundColor: theme.foregroundColor,
    backgroundColor: theme.backgroundColor,
    borderRadius: theme.borderRadius,
    margin: theme.margin,
    autoCloseDuration: theme.autoCloseDuration,
    padding: theme.padding,
    closeButton: theme.closeButton,
    animationBuilder: (_, animation, alignment, child) {
      return theme.animationBuilder?.call(_, animation, alignment, child) ??
          FadeTransition(opacity: animation, child: child);
    },
  );
}

///取消所有toast
void cancelToast() {
  toastification.dismissAll();
}

///显示等待对话框
void showLoading([String? msg]) {
  LoadingDialog.show(msg: msg);
}

///关闭等待对话框
void dismissLoading() {
  LoadingDialog.dismiss();
}
