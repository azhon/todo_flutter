/// createTime: 2021/10/15 on 11:54
/// desc:
///
/// @author azhon

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
