import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/loading_state.dart';
import 'package:todo_flutter/src/base/ui_adapter.dart';
import 'package:todo_flutter/src/base/ui_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/src/service/event/global_event_manager.dart';

/// createTime: 2021/9/17 on 21:18
/// desc:
///
/// @author azhon

///UI
abstract class BaseUIState<T extends StatefulWidget> extends State<T>
    with UIAdapter, UIWidget {}

///bloc
abstract class BaseBlocState<T extends StatefulWidget> extends BaseUIState<T>
    with LoadingState {
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
      throw Exception('please use addBloc($B()) first...');
    }
    return list.first as B;
  }

  @override
  void sendEventToView(String type, [data]) {}

  @override
  void dispose() {
    super.dispose();

    ///组件销毁，释放bloc
    _blocs?.forEach((element) {
      element.close();
    });
    _blocs?.clear();
  }
}

///global event
abstract class BaseGlobalEventState<T extends StatefulWidget>
    extends BaseBlocState<T> {
  StreamSubscription? _streamSubscription;

  ///only one listener
  ///[type] Specify event type
  void listenerGlobalEvent({
    required ValueChanged<String?> event,
    List<String>? type,
  }) {
    _cancel();
    _streamSubscription = GlobalEventManager.instance.subscribe((global) {
      if (type == null) {
        event.call(global.data);
      } else {
        if (type.contains(global.type)) {
          event.call(global.data);
        }
      }
    });
  }

  void _cancel() {
    if (_streamSubscription != null) {
      _streamSubscription?.cancel();
      _streamSubscription = null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _cancel();
  }
}

abstract class BaseState<T extends StatefulWidget>
    extends BaseGlobalEventState<T> {}
