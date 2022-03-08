import 'package:flutter_basic_lib/base/bloc/base_event.dart';
import 'package:flutter_basic_lib/bloc/list/list_bloc.dart';
import 'package:flutter_basic_lib/bloc/list/list_state.dart';

abstract class ListEvent<T> extends BaseEvent<ListBloc<T>, ListState<T>> {}

class InitEvent<T> extends ListEvent<T> {
  @override
  Future<ListState<T>> on(ListBloc<T> bloc, ListState<T> currentState) async {
    bloc.showPageLoading();
    var bean = await bloc.request.request();
    var list = bean.data?.data;
    bloc.dismissPageLoading();
    return InitialState(list as List<T>);
  }
}

class RefreshEvent<T> extends ListEvent<T> {
  @override
  Future<ListState<T>> on(ListBloc<T> bloc, ListState<T> currentState) async {
    var bean = await bloc.request.request();
    var list = bean.data?.data;
    bloc.controller.refreshCompleted();
    return InitialState(list as List<T>);
  }
}
