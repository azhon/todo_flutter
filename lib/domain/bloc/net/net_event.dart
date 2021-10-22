/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    net_event
 * 创建时间:  2021/10/15 on 11:55
 * 描述:     
 *
 * @author   阿钟
 */
import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:todo_flutter/domain/bean/get_bean.dart';
import 'package:todo_flutter/domain/bloc/net/net_bloc.dart';
import 'package:todo_flutter/domain/bloc/net/net_state.dart';
import 'package:todo_flutter/domain/repository/net_request.dart';

abstract class NetEvent extends BaseEvent<NetBloc, NetState> {}

class GetEvent extends NetEvent {
  @override
  Future<NetState> on(NetBloc bloc, NetState currentState) async {
    bloc.showPageLoading();
    var bean = await NetGetRequest().request();
    await Future.delayed(Duration(seconds: 1));
    bloc.dismissPageLoading();
    bloc.loadDone();
    return NetInitialState(bean.data);
  }
}

class PostEvent extends NetEvent {
  @override
  Future<NetState> on(NetBloc bloc, NetState currentState) async {
    bloc.loading();
    var bean = await NetPostRequest().request();
    await Future.delayed(Duration(seconds: 1));
    bloc.loadError(bean);
    return NetInitialState(GetBean());
  }
}
