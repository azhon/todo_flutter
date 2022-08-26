/// createTime: 2021/10/21 on 14:55
/// desc:
///
/// @author azhon
import 'package:flutter_basic_lib/bloc/load/load_event.dart';
import 'package:flutter_basic_lib/bloc/load/load_state.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

class LoadBloc extends BaseLoadBloc<LoadEvent, LoadState> {
  LoadBloc() : super(InitialState());

  loading() {
    add(LoadingEvent());
  }

  loadDone() {
    add(InitialEvent());
  }

  loadError(ApiException exception) {
    add(ErrorEvent(exception));
  }
}
