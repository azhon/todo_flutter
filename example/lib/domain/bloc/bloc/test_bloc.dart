/// createTime: 2021/9/29 on 17:10
/// desc:
///
/// @author azhon

import 'dart:math';

import 'package:todo_flutter/todo_flutter.dart';
import 'package:todo_flutter_example/domain/bloc/bloc/test_event.dart';
import 'package:todo_flutter_example/domain/bloc/bloc/test_state.dart';

class TestBloc extends BaseBloc<TestEvent, TestState> {
  DataChangeBloc<int> dataChangeBloc = DataChangeBloc(0);

  TestBloc() : super(TestInitialState(null));

  void init() {
    add(InitEvent());
  }

  void changeData() {
    final int random = Random().nextInt(9999);
    dataChangeBloc.changeData(random);
  }
}
