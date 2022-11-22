/// createTime: 2021/10/19 on 17:15
/// desc:
///
/// @author azhon
import 'package:todo_flutter/src/service/theme/toast_theme_data.dart';

mixin LoadingState {
  void showLoadingDialog({String? msg});

  void dismissLoadingDialog();

  void showToast(String msg, {ToastThemeData? data});
}
