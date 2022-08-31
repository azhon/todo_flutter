/// createTime: 2021/9/30 on 10:47
/// desc:
///
/// @author azhon
import 'package:flutter_bloc/flutter_bloc.dart';

class DataChangeBloc<T> extends Cubit<T?> {
  DataChangeBloc(T? data) : super(data);

  void changeData(T? data) {
    emit(data);
  }
}
