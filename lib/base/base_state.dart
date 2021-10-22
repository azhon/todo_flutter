/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    base_state
 * 创建时间:  2021/9/17 on 21:18
 * 描述:     TODO
 *
 * @author   阿钟
 */
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/base/bloc/base_bloc.dart';
import 'package:flutter_basic_lib/base/loading_state.dart';
import 'package:flutter_basic_lib/base/ui_adapter.dart';
import 'package:flutter_basic_lib/base/ui_widget.dart';
import 'package:flutter_basic_lib/error/runtime_exception.dart';
import 'package:flutter_basic_lib/route/router_util.dart';
import 'package:flutter_basic_lib/ui/widget/loading_dialog_widget.dart';

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
  List<BaseBloc>? _blocs;

  ///添加bloc进行管理
  addBloc(BaseBloc bloc) {
    if (_blocs == null) _blocs = [];
    _blocs!.add(bloc);
  }

  ///获取bloc进行管理
  B getBloc<B extends BaseBloc>() {
    var list = _blocs
        ?.where((element) => element.runtimeType.toString() == B.toString())
        .toList();
    if (list == null || list.isEmpty)
      throw RuntimeException('please use addBloc(${B.toString()}()) first...');
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
        return LoadingDialog(msg: msg);
      },
    ).then((value) => _isShowLoadingDialog = false);
  }

  @override
  void dismissLoadingDialog() {
    if (_isShowLoadingDialog) RouterUtil.instance.pop();
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
