import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/base_state.dart';
import 'package:todo_flutter/src/bloc/list/list_bloc.dart';
import 'package:todo_flutter/src/bloc/list/list_state.dart';
import 'package:todo_flutter/src/net/entity/base_entity.dart';
import 'package:todo_flutter/src/ui/common_empty_widget.dart';
import 'package:todo_flutter/src/ui/widget/bloc_load_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

typedef RefreshChild<T> = Widget Function(BuildContext context, List<T> list);

class CommonRefreshWidget<T> extends StatefulWidget {
  final ListBloc<T> bloc;
  final RefreshChild<T> child;
  final bool enablePullDown;
  final bool enablePullUp;
  final Widget? emptyWidget;
  final bool wantKeepAlive;
  final bool autoInit;
  final ValueChanged<BaseEntity?>? result;

  const CommonRefreshWidget({
    required this.bloc,
    required this.child,
    this.emptyWidget,
    this.result,
    this.enablePullDown = true,
    this.enablePullUp = true,
    this.wantKeepAlive = false,
    this.autoInit = true,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CommonRefreshWidgetState<T>();
}

class _CommonRefreshWidgetState<T> extends BaseState<CommonRefreshWidget<T>>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    if (widget.autoInit) {
      widget.bloc.init();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ListBloc<T>, ListState<T>>(
      bloc: widget.bloc,
      builder: (BuildContext context, ListState<T> state) {
        widget.result?.call(state.entity);
        return BlocLoadWidget(
          loadBloc: widget.bloc.loadBloc,
          reload: () => widget.bloc.init(),
          child: SmartRefresher(
            onRefresh: () => widget.bloc.refresh(),
            onLoading: () => widget.bloc.loadMore(),
            controller: widget.bloc.controller,
            enablePullDown: widget.enablePullDown,
            enablePullUp: widget.enablePullUp,
            physics: const ClampingScrollPhysics(),
            header: const MaterialClassicHeader(),
            child: state.data.isEmpty
                ? _emptyView()
                : widget.child.call(context, state.data),
          ),
        );
      },
    );
  }

  Widget _emptyView() {
    return Center(
      child: widget.emptyWidget ?? const CommonEmptyWidget(),
    );
  }

  @override
  bool get wantKeepAlive => widget.wantKeepAlive;
}
