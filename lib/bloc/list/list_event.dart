import 'package:flutter_basic_lib/bloc/list/list_state.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

abstract class ListEvent<T> extends BaseEvent<ListBloc<T>, ListState<T>> {}

class InitEvent<T> extends ListEvent<T> {
  @override
  Future<ListState<T>> on(ListBloc<T> bloc, ListState<T> currentState) async {
    bloc.showPageLoading();
    bloc.loading();
    var bean = await bloc.request.request();
    var list = bean.data?.data;
    bloc.dismissPageLoading();
    bloc.loadDone();
    return InitialState(list as List<T>);
  }
}

class RefreshEvent<T> extends ListEvent<T> {
  @override
  Future<ListState<T>> on(ListBloc<T> bloc, ListState<T> currentState) async {
    var bean = await bloc.request.request();
    var list = bean.data?.data;
    bloc.controller.refreshCompleted();
    if (bean.data?.curPage == bean.data?.totalPage) {
      bloc.controller.loadNoData();
    }
    return InitialState(list as List<T>);
  }
}

class LoadMoreEvent<T> extends ListEvent<T> {
  @override
  Future<ListState<T>> on(ListBloc<T> bloc, ListState<T> currentState) async {
    var bean = await bloc.request.request();
    if (bean.code == BaseBean.DEFAULT_CODE) {
      bloc.controller.loadFailed();
      bloc.loadMoreError();
      return currentState;
    }
    var list = bean.data?.data;
    currentState.data.addAll(list as List<T>);
    if (list.length < bloc.pageSize) {
      bloc.controller.loadNoData();
    } else {
      bloc.controller.loadComplete();
    }
    return InitialState(currentState.data);
  }
}
