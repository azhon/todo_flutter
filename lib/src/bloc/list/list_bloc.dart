import 'package:todo_flutter/src/base/bloc/base_bloc.dart';
import 'package:todo_flutter/src/bloc/list/list_event.dart';
import 'package:todo_flutter/src/bloc/list/list_state.dart';
import 'package:todo_flutter/src/net/base_request.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListBloc<T> extends BaseBloc<ListEvent<T>, ListState<T>> {
  int pageNum = 1;
  final int pageSize;
  final BaseRequest<List<T>> request;
  final RefreshController controller = RefreshController();

  ListBloc({
    required this.request,
    this.pageSize = 15,
  }) : super(InitialState(<T>[]));

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

    ///处理页码存在url path上
    if (request.url.contains(request.page)) {
      final realUrl = request.url.replaceAll(request.page, '$pageNum');
      request.params![request.pagingUrlKey] = realUrl;
    } else {
      request.params![request.pageKey] = pageNum;
    }
    request.params![request.pageSizeKey] = pageSize;
  }
}
