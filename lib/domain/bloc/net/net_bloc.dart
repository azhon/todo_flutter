/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    net_bloc
 * 创建时间:  2021/10/15 on 11:54
 * 描述:     
 *
 * @author   阿钟
 */
import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:todo_flutter/domain/bloc/net/net_event.dart';
import 'package:todo_flutter/domain/bloc/net/net_state.dart';

class NetBloc extends BaseBloc<NetEvent, NetState> {
  NetBloc() : super(NetInitialState(null));

  void get() {
    add(GetEvent());
  }

  void post() {
    add(PostEvent());
  }
}
