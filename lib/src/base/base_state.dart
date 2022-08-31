/// createTime: 2021/9/17 on 21:18
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/src/base/loading_state.dart';
import 'package:flutter_basic_lib/src/base/ui_adapter.dart';
import 'package:flutter_basic_lib/src/base/ui_widget.dart';
import 'package:flutter_basic_lib/src/service/error/runtime_exception.dart';
import 'package:flutter_basic_lib/src/service/route/router_util.dart';
import 'package:flutter_basic_lib/src/service/theme/toast_theme_data.dart';
import 'package:flutter_basic_lib/src/ui/widget/loading_dialog_widget.dart';
import 'package:flutter_basic_lib/todo_lib.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class BaseState<T extends StatefulWidget> extends BaseBlocState<T> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

abstract class BaseBlocState<T extends StatefulWidget> extends BaseUIState<T>
    with LoadingState {
  bool _isShowLoadingDialog = false;
  List<BlocBase>? _blocs;

  ///添加bloc进行管理
  void addBloc(BlocBase bloc) {
    _blocs ??= [];
    _blocs!.add(bloc);
  }

  ///获取bloc进行管理
  B getBloc<B extends BlocBase>() {
    final list = _blocs
        ?.where((element) => element.runtimeType.toString() == B.toString())
        .toList();
    if (list == null || list.isEmpty) {
      throw RuntimeException('please use addBloc(${B.toString()}()) first...');
    }
    return list.first as B;
  }

  @override
  void showLoadingDialog({String? msg}) {
    _isShowLoadingDialog = true;
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return LoadingDialogWidget(msg: msg);
      },
    ).then((value) => _isShowLoadingDialog = false);
  }

  @override
  void dismissLoadingDialog() {
    if (_isShowLoadingDialog) {
      RouterUtil.instance.pop();
    }
  }

  @override
  void showToast(String msg, {ToastThemeData? data}) {
    final ToastThemeData themeData = data ?? TodoLib.of(context).toastThemeData;
    Fluttertoast.showToast(
      msg: msg,
      fontSize: themeData.fontSize,
      textColor: themeData.textColor,
      backgroundColor: themeData.backgroundColor,
      toastLength: themeData.toastLength,
      gravity: themeData.gravity,
    );
  }

  @override
  void dispose() {
    super.dispose();

    ///组件销毁，释放bloc
    _blocs?.forEach((element) {
      element.close();
    });
  }
}

abstract class BaseUIState<T extends StatefulWidget> extends State<T>
    with UIAdapter, UIWidget {}
