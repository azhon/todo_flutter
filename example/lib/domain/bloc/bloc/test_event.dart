/// createTime: 2021/9/29 on 17:11
/// desc:
///
/// @author azhon

import 'dart:math';

import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:todo_flutter/domain/bloc/bloc/test_bloc.dart';
import 'package:todo_flutter/domain/bloc/bloc/test_state.dart';

abstract class TestEvent extends BaseEvent<TestBloc, TestState> {}

class InitEvent extends TestEvent {
  @override
  Future<TestState> on(TestBloc bloc, TestState currentState) async {
    bloc.showPageLoading();
    final result = Random().nextInt(9999).toString();
    await Future.delayed(const Duration(milliseconds: 1500));
    bloc.dismissPageLoading();
    return Future.value(TestInitialState(result));
  }
}
