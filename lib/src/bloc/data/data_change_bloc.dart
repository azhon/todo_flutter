import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/src/bloc/data/data_change_state.dart';

/// createTime: 2021/9/30 on 10:47
/// desc:
///
/// @author azhon
class DataChangeBloc<T> extends Cubit<DataChangeState<T?>> {
  DataChangeBloc(T? data) : super(DataChangeState(data));

  void changeData(T? data) {
    if (isClosed) {
      return;
    }
    emit(DataChangeState(data));
  }

  void update() {
    changeData(state.data);
  }
}
