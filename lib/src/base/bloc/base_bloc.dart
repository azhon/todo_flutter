/// createTime: 2021/9/29 on 16:49
/// desc:
///
/// @author azhon

import 'package:todo_flutter/src/base/bloc/base_event.dart';
import 'package:todo_flutter/src/base/loading_state.dart';
import 'package:todo_flutter/src/bloc/load/load_bloc.dart';
import 'package:todo_flutter/src/net/entity/base_entity.dart';
import 'package:todo_flutter/src/service/error/api_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseLoadBloc<E extends BaseEvent, S> extends Bloc<E, S> {
  BaseLoadBloc(S initialState) : super(initialState) {
    _init();
  }

  void _init() {
    ///分发至event处理
    on<E>((E event, Emitter<S> emit) async {
      final S resultState = await event.on(this, state);
      emit.call(resultState);
      onStateChange(resultState);
    });
  }

  ///状态变更
  void onStateChange(S state) {}
}

abstract class BaseBloc<E extends BaseEvent, S> extends BaseLoadBloc<E, S> {
  LoadingState? _loadingState;
  final LoadBloc _loadBloc = LoadBloc();

  LoadBloc get loadBloc => _loadBloc;

  Future<void> setState(LoadingState? state) async {
    _loadingState = state;
  }

  BaseBloc(S initialState) : super(initialState);

  ///显示全屏加载等待框
  void showLoading({String? msg}) {
    _loadingState?.showLoading(msg: msg);
  }

  ///关闭全屏加载等待框
  void dismissLoading() {
    _loadingState?.dismissLoading();
  }

  ///显示提示
  void showToast(String msg) {
    _loadingState?.showToast(msg);
  }

  ///配合BlocLoadWidget使用，开始加载
  void loading() {
    loadBloc.loading();
  }

  ///配合BlocLoadWidget使用，加载完成
  void loadDone() {
    loadBloc.loadDone();
  }

  ///配合BlocLoadWidget使用，加载失败
  void loadError(BaseEntity entity) {
    loadBloc.loadError(ApiException(entity));
  }

  @override
  Future<void> close() async {
    await loadBloc.close();
    await super.close();
  }
}
