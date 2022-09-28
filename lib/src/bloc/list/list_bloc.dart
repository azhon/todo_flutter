import 'package:flutter_basic_lib/src/base/bloc/base_bloc.dart';
import 'package:flutter_basic_lib/src/bloc/list/list_event.dart';
import 'package:flutter_basic_lib/src/bloc/list/list_state.dart';
import 'package:flutter_basic_lib/src/net/base_request.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListBloc<T> extends BaseBloc<ListEvent<T>, ListState<T>> {
  int pageNum = 1;
  int pageSize = 15;
  final BaseRequest<List<T>> request;
  final RefreshController controller = RefreshController();

  ListBloc({required this.request}) : super(InitialState(<T>[]));

  void init() {
    pageNum = 1;
    _changeParams();
    add(InitEvent());
  }

  void refresh() {
    pageNum = 1;
    _changeParams();
    add(RefreshEvent());
  }

  void loadMore() {
    pageNum++;
    _changeParams();
    add(LoadMoreEvent());
  }

  void loadMoreError() {
    pageNum--;
    _changeParams();
  }

  void _changeParams() {
    request.params ??= {};
    request.params!['page'] = pageNum;
    request.params!['limit'] = pageSize;
  }
}
