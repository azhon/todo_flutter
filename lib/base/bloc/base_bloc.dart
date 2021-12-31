/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    base_bloc
 * 创建时间:  2021/9/29 on 16:49
 * 描述:     TODO
 *
 * @author   阿钟
 */
import 'package:flutter_basic_lib/base/loading_state.dart';
import 'package:flutter_basic_lib/bloc/load/load_bloc.dart';
import 'package:flutter_basic_lib/error/api_exception.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

abstract class BaseLoadBloc<E extends BaseEvent, S> extends Bloc<E, S> {
  BaseLoadBloc(S initialState) : super(initialState) {
    _init();
  }

  _init() {
    ///分发至event处理
    on<E>((E event, Emitter<S> emit) async {
      S resultState = await event.on(this, state);
      emit.call(resultState);
      onStateChange(resultState);
    });
  }

  ///状态变更
  void onStateChange(S state) {}
}

abstract class BaseBloc<E extends BaseEvent, S> extends BaseLoadBloc<E, S> {
  LoadingState? _loadingState;
  LoadBloc _loadBloc = LoadBloc();

  LoadBloc get loadBloc => _loadBloc;

  void setState(LoadingState state) {
    this._loadingState = state;
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

  ///配合[BlocLoadWidget]使用，开始加载
  void loading() {
    loadBloc.loading();
  }

  ///配合[BlocLoadWidget]使用，加载完成
  void loadDone() {
    loadBloc.loadDone();
  }

  ///配合[BlocLoadWidget]使用，加载失败
  void loadError(BaseBean bean) {
    loadBloc.loadError(ApiException(bean));
  }

  Future<void> close() async {
    loadBloc.close();
    super.close();
  }
}
