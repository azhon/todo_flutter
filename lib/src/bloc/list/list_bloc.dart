import 'package:todo_flutter/src/base/bloc/base_bloc.dart';
import 'package:todo_flutter/src/bloc/list/list_event.dart';
import 'package:todo_flutter/src/bloc/list/list_state.dart';
import 'package:todo_flutter/src/net/base_request.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListBloc<T> extends BaseBloc<ListEvent<T>, ListState<T>> {
  ///当前页码
  late int pageNum;

  ///初始页码
  final int startPageNum;

  ///分页一页数量
  final int pageSize;
  BaseRequest<List<T>> request;
  final RefreshController controller = RefreshController();

  ListBloc({
    required this.request,
    this.pageSize = 15,
    this.startPageNum = 1,
  }) : super(InitialState(<T>[], null)) {
    this.pageNum = startPageNum;
  }

  void init() {
    pageNum = startPageNum;
    _changeParams();
    add(InitEvent());
  }

  void refresh() {
    pageNum = startPageNum;
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

  // ignore: use_setters_to_change_properties
  void resetRequest(BaseRequest<List<T>> request) {
    this.request = request;
    pageNum = startPageNum;
    _changeParams();
    add(InitEvent());
  }

  void updateState(List<T> list) {
    add(UpdateEvent(list));
  }

  void _changeParams() {
    request.params ??= <String, dynamic>{};

    ///请求参数不是Map类型，则不处理页码在url path上
    if (request.params is! Map<String, dynamic>) {
      return;
    }
    final map = request.params! as Map<String, dynamic>;

    ///处理页码存在url path上
    if (request.url.contains(request.page)) {
      final realUrl = request.url.replaceAll(request.page, '$pageNum');
      map[request.pagingUrlKey] = realUrl;
    } else {
      map[request.pageKey] = pageNum;
    }
    map[request.pageSizeKey] = pageSize;
  }

  @override
  Future<void> close() async {
    controller.dispose();
    await super.close();
  }
}
