/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    data_change_bloc
 * 创建时间:  2021/9/30 on 10:47
 * 描述:
 *
 * @author   阿钟
 */

import 'package:flutter_basic_lib/flutter_basic_lib.dart';

class DataChangeBloc<T> extends Cubit<T> {
  DataChangeBloc(T data) : super(data);

  void changeData(T data) {
    emit(data);
  }
}
