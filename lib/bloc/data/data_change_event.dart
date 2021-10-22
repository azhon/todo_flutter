/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    data_change_event
 * 创建时间:  2021/9/30 on 10:48
 * 描述:     TODO
 *
 * @author   阿钟
 */
import 'package:flutter_basic_lib/base/bloc/base_event.dart';
import 'package:flutter_basic_lib/bloc/data/data_change_bloc.dart';
import 'package:flutter_basic_lib/bloc/data/data_change_state.dart';

class DataChangeEvent<T> extends BaseEvent<DataChangeBloc, DataChangeState> {
  final T data;

  DataChangeEvent(this.data);

  @override
  Future<DataChangeState> on(
      DataChangeBloc bloc, DataChangeState currentState) {
    return Future.value(DataChangeInitialState<T>(data));
  }
}
