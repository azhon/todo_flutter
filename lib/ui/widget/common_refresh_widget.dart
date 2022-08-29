import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/bloc/list/list_state.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

typedef RefreshChild<T> = Widget Function(BuildContext context, List<T> list);

class CommonRefreshWidget<T> extends StatefulWidget {
  final ListBloc<T> bloc;
  final RefreshChild<T> child;
  final bool enablePullUp;
  final Widget? emptyWidget;

  const CommonRefreshWidget({
    required this.bloc,
    required this.child,
    this.enablePullUp = true,
    this.emptyWidget,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CommonRefreshWidgetState<T>();
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
        return BlocLoadWidget(
          loadBloc: widget.bloc.loadBloc,
          child: RefreshConfiguration(
            hideFooterWhenNotFull: true,
            child: SmartRefresher(
              onRefresh: () => widget.bloc.refresh(),
              onLoading: () => widget.bloc.loadMore(),
              controller: widget.bloc.controller,
              enablePullUp: widget.enablePullUp,
              physics: const ClampingScrollPhysics(),
              header: const MaterialClassicHeader(),
              child: state.data.isEmpty
                  ? _emptyView()
                  : widget.child.call(context, state.data),
            ),
          ),
        );
      },
    );
  }

  Widget _emptyView() {
    return Center(
      child: widget.emptyWidget ??
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonText(
                '(⌒▽⌒)',
                color: const Color(0xFF666666),
              ),
              sizedBox(height: 4),
              CommonText(
                'No Data.',
                color: const Color(0xFF666666),
              )
            ],
          ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.bloc.close();
  }
}
