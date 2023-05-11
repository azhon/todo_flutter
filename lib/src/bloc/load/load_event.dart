/// createTime: 2021/10/21 on 14:56
/// desc:
///
/// @author azhon

import 'package:todo_flutter/src/base/bloc/base_event.dart';
import 'package:todo_flutter/src/bloc/load/load_bloc.dart';
import 'package:todo_flutter/src/bloc/load/load_state.dart';
import 'package:todo_flutter/src/service/error/domain_exception.dart';

abstract class LoadEvent extends BaseEvent<LoadBloc, LoadState> {}

class InitialEvent extends LoadEvent {
  @override
  Future<LoadState> on(LoadBloc bloc, LoadState currentState) async {
    return InitialState();
  }
}

class LoadingEvent extends LoadEvent {
  @override
  Future<LoadState> on(LoadBloc bloc, LoadState currentState) async {
    return LoadingState();
  }
}

class ErrorEvent extends LoadEvent {
  final DomainException exception;

  ErrorEvent(this.exception);

  @override
  Future<LoadState> on(LoadBloc bloc, LoadState currentState) async {
    return ErrorState(exception);
  }
}
