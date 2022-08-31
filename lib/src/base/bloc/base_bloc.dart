/// createTime: 2021/9/29 on 16:49
/// desc:
///
/// @author azhon

import 'package:flutter_basic_lib/src/base/bloc/base_event.dart';
import 'package:flutter_basic_lib/src/base/loading_state.dart';
import 'package:flutter_basic_lib/src/bloc/load/load_bloc.dart';
import 'package:flutter_basic_lib/src/net/bean/base_result_bean.dart';
import 'package:flutter_basic_lib/src/service/error/api_exception.dart';
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
  void showPageLoading({String? msg}) {
    _loadingState?.showLoadingDialog(msg: msg);
  }

  ///关闭全屏加载等待框
  void dismissPageLoading() {
    _loadingState?.dismissLoadingDialog();
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
  void loadError(BaseBean bean) {
    loadBloc.loadError(ApiException(bean));
  }

  @override
  Future<void> close() async {
    await loadBloc.close();
    await super.close();
  }
}
