import 'package:flutter_basic_lib/bloc/list/list_event.dart';
import 'package:flutter_basic_lib/bloc/list/list_state.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListBloc<T> extends BaseBloc<ListEvent<T>, ListState<T>> {
  int pageNum = 1;
  int pageSize = 15;
  final BaseRequest<BaseListResultBean> request;
  final RefreshController controller = RefreshController();

  ListBloc({required this.request}) : super(InitialState(<T>[]));

  void init() {
    _reset();
    add(InitEvent());
  }

  void refresh() {
    _reset();
    add(RefreshEvent());
  }

  void load() {}

  _reset() {
    pageNum = 1;
    if (request.params == null) request.params = {};
    request.params!['pageNum'] = pageNum;
    request.params!['pageSize'] = pageSize;
  }
}
