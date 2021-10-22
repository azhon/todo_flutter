/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    test_event
 * 创建时间:  2021/9/29 on 17:11
 * 描述:     TODO
 *
 * @author   阿钟
 */
import 'dart:math';

import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:todo_flutter/domain/bloc/bloc/test_bloc.dart';
import 'package:todo_flutter/domain/bloc/bloc/test_state.dart';

abstract class TestEvent extends BaseEvent<TestBloc, TestState> {}

class InitEvent extends TestEvent {
  @override
  Future<TestState> on(TestBloc bloc, TestState currentState) {
    var result = Random().nextInt(9999).toString();
    return Future.value(TestInitialState(result));
  }
}
