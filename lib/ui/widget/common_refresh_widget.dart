import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/bloc/list/list_state.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

typedef RefreshChild<T> = Widget Function(BuildContext context, List<T> list);

class CommonRefreshWidget<T> extends StatefulWidget {
  final ListBloc<T> bloc;
  final RefreshChild<T> child;
  final bool enablePullUp;

  const CommonRefreshWidget({
    Key? key,
    required this.bloc,
    required this.child,
    this.enablePullUp = true,
  }) : super(key: key);

  @override
  _CommonRefreshWidgetState createState() => _CommonRefreshWidgetState<T>();
}

class _CommonRefreshWidgetState<T> extends BaseState<CommonRefreshWidget<T>> {
  @override
  void initState() {
    super.initState();
    widget.bloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListBloc<T>, ListState<T>>(
      bloc: widget.bloc,
      builder: (BuildContext context, ListState<T> state) {
        return RefreshConfiguration(
          hideFooterWhenNotFull: true,
          child: SmartRefresher(
            onRefresh: () => widget.bloc.refresh(),
            onLoading: () => widget.bloc.loadMore(),
            controller: widget.bloc.controller,
            enablePullDown: true,
            enablePullUp: widget.enablePullUp,
            physics: ClampingScrollPhysics(),
            header: MaterialClassicHeader(),
            child: widget.child.call(context, state.data),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.bloc.close();
  }
}
