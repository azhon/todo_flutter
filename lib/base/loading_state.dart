/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    loading_state
 * 创建时间:  2021/10/19 on 17:15
 * 描述:     
 *
 * @author   阿钟
 */
import 'package:flutter_basic_lib/theme/toast_theme_data.dart';

mixin LoadingState {
  void showLoadingDialog({String? msg});

  void dismissLoadingDialog();

  void showToast(String msg, {ToastThemeData? data});
}
