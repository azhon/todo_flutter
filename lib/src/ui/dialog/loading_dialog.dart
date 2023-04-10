import 'package:flutter/material.dart';
import 'package:todo_flutter/src/service/route/router_util.dart';
import 'package:todo_flutter/src/ui/dialog/common_dialog.dart';
import 'package:todo_flutter/todo_lib.dart';

/// createTime: 2023/4/4 on 20:14
/// desc:
///
/// @author azhon
class LoadingDialog {
  static bool _isShowLoadingDialog = false;
  static LoadingDialogController controller = LoadingDialogController();

  ///显示对话框
  static void show({String? msg}) {
    controller.updateMsg(msg);
    if (_isShowLoadingDialog) {
      return;
    }
    _isShowLoadingDialog = true;
    CommonDialog.instance
        .loadingDialog(
          TodoLib.navigatorKey.currentContext!,
          controller: controller,
        )
        .then((value) => _isShowLoadingDialog = false);
  }

  ///隐藏对话框
  static void dismiss() {
    if (_isShowLoadingDialog) {
      RouterUtil.instance.pop();
    }
  }
}

class LoadingDialogController extends ChangeNotifier {
  String? msg;

  void updateMsg(String? msg) {
    this.msg = msg;
    notifyListeners();
  }
}
