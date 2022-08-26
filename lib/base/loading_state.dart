/// createTime: 2021/10/19 on 17:15
/// desc:
///
/// @author azhon
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

mixin LoadingState {
  void showLoadingDialog({String? msg});

  void dismissLoadingDialog();

  void showToast(String msg, {ToastThemeData? data});
}
