/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    test_bloc
 * 创建时间:  2021/9/29 on 17:10
 * 描述:     TODO
 *
 * @author   阿钟
 */
import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:todo_flutter/domain/bloc/bloc/test_event.dart';
import 'package:todo_flutter/domain/bloc/bloc/test_state.dart';

class TestBloc extends BaseBloc<TestEvent, TestState> {
  TestBloc() : super(TestInitialState(null));

  init() {
    add(InitEvent());
  }

  @override
  void onStateChange(TestState state) {
    return super.onStateChange(state);
  }
}
