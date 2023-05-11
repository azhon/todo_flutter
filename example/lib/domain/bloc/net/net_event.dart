/// createTime: 2021/10/15 on 11:55
/// desc:
///
/// @author azhon

import 'package:todo_flutter/todo_flutter.dart';
import 'package:todo_flutter_example/domain/bloc/net/net_bloc.dart';
import 'package:todo_flutter_example/domain/bloc/net/net_state.dart';
import 'package:todo_flutter_example/domain/request/net_request.dart';

abstract class NetEvent extends BaseEvent<NetBloc, NetState> {}

class GetEvent extends NetEvent {
  @override
  Future<NetState> on(NetBloc bloc, NetState currentState) async {
    showLoading();
    final bean = await NetGetRequest().request();
    await Future.delayed(const Duration(seconds: 1));
    dismissLoading();
    bloc.loadDone();
    return NetInitialState(bean.data);
  }
}

class PostEvent extends NetEvent {
  @override
  Future<NetState> on(NetBloc bloc, NetState currentState) async {
    bloc.loading();
    final bean = await NetPostRequest().request();
    await Future.delayed(const Duration(seconds: 1));
    bloc.loadError(NetworkException(bean));
    return NetInitialState(null);
  }
}
