/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    data_change_bloc
 * 创建时间:  2021/9/30 on 10:47
 * 描述:     TODO
 *
 * @author   阿钟
 */

import 'package:flutter_basic_lib/base/bloc/base_bloc.dart';
import 'package:flutter_basic_lib/bloc/data/data_change_event.dart';
import 'package:flutter_basic_lib/bloc/data/data_change_state.dart';

class DataChangeBloc<T>
    extends BaseBloc<DataChangeEvent<T>, DataChangeState<T>> {
  DataChangeBloc({T? data}) : super(DataChangeInitialState(data));

  void changeData(T data) {
    add(DataChangeEvent(data));
  }
}
