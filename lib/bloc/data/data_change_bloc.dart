/// createTime: 2021/9/30 on 10:47
/// desc:
///
/// @author azhon
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

class DataChangeBloc<T> extends Cubit<T> {
  DataChangeBloc(T data) : super(data);

  void changeData(T data) {
    emit(data);
  }
}
