/// createTime: 2021/10/21 on 14:55
/// desc:
///
/// @author azhon
import 'package:flutter_basic_lib/src/base/bloc/base_bloc.dart';
import 'package:flutter_basic_lib/src/bloc/load/load_event.dart';
import 'package:flutter_basic_lib/src/bloc/load/load_state.dart';
import 'package:flutter_basic_lib/src/service/error/api_exception.dart';

class LoadBloc extends BaseLoadBloc<LoadEvent, LoadState> {
  LoadBloc() : super(InitialState());

  void loading() {
    add(LoadingEvent());
  }

  void loadDone() {
    add(InitialEvent());
  }

  void loadError(ApiException exception) {
    add(ErrorEvent(exception));
  }
}
