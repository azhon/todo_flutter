import 'package:todo_flutter/src/base/bloc/base_event.dart';
import 'package:todo_flutter/src/bloc/list/list_bloc.dart';
import 'package:todo_flutter/src/bloc/list/list_state.dart';
import 'package:todo_flutter/src/net/entity/base_entity.dart';
import 'package:todo_flutter/src/service/error/domain_exception.dart';

abstract class ListEvent<T> extends BaseEvent<ListBloc<T>, ListState<T>> {}

class InitEvent<T> extends ListEvent<T> {
  @override
  Future<ListState<T>> on(ListBloc<T> bloc, ListState<T> currentState) async {
    bloc.loading();
    final bean = await bloc.request.request();
    if (bean.code == BaseEntity.defaultCode) {
      bloc.loadError(NetworkException(bean));
      return InitialState<T>(<T>[], bean);
    }
    final list = bean.data ?? <T>[];
    bloc.loadDone();
    if (bean.curPage == bean.totalPage) {
      bloc.controller.loadNoData();
    } else {
      bloc.controller.resetNoData();
    }
    return InitialState(list, bean);
  }
}

class RefreshEvent<T> extends ListEvent<T> {
  @override
  Future<ListState<T>> on(ListBloc<T> bloc, ListState<T> currentState) async {
    final bean = await bloc.request.request();
    if (bean.code == BaseEntity.defaultCode) {
      bloc.loadError(NetworkException(bean));
      return InitialState<T>(<T>[], bean);
    }
    final list = bean.data ?? <T>[];
    bloc.controller.refreshCompleted();
    if (bean.curPage == bean.totalPage) {
      bloc.controller.loadNoData();
    } else {
      bloc.controller.resetNoData();
    }
    return InitialState(list, bean);
  }
}

class LoadMoreEvent<T> extends ListEvent<T> {
  @override
  Future<ListState<T>> on(ListBloc<T> bloc, ListState<T> currentState) async {
    final bean = await bloc.request.request();
    if (bean.code == BaseEntity.defaultCode) {
      bloc.controller.loadFailed();
      bloc.loadMoreError();
      return currentState;
    }
    final list = bean.data ?? <T>[];
    currentState.data.addAll(list);
    if (bean.curPage == bean.totalPage) {
      bloc.controller.loadNoData();
    } else {
      bloc.controller.loadComplete();
    }
    return InitialState(currentState.data, bean);
  }
}

class UpdateEvent<T> extends ListEvent<T> {
  final List<T> list;

  UpdateEvent(this.list);

  @override
  Future<ListState<T>> on(ListBloc<T> bloc, ListState<T> currentState) async {
    return InitialState(list, currentState.entity);
  }
}
