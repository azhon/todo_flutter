/// createTime: 2021/10/19 on 17:15
/// desc:
///
/// @author azhon
import 'package:todo_flutter/src/service/theme/toast_theme_data.dart';

mixin LoadingState {
  void showLoading({String? msg});

  void dismissLoading();

  void showToast(String msg, {ToastThemeData? data});
}
