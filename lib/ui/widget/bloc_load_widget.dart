/// createTime: 2021/10/21 on 15:37
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/bloc/load/load_bloc.dart';
import 'package:flutter_basic_lib/bloc/load/load_state.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

class BlocLoadWidget extends BaseStatelessWidget {
  final Widget child;
  final Widget? error;
  final LoadBloc loadBloc;

  BlocLoadWidget({
    required this.child,
    required this.loadBloc,
    this.error,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadBloc, LoadState>(
      bloc: loadBloc,
      builder: (BuildContext context, LoadState state) {
        if (state is LoadingState) {
          return SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
              ],
            ),
          );
        }
        if (state is ErrorState) {
          return _errorWidget();
        }
        return child;
      },
    );
  }

  Widget _errorWidget() {
    if (error != null) {
      return error!;
    }
    return Container(
      height: setWidth(200),
      alignment: Alignment.center,
      child: CommonText('加载失败~'),
    );
  }
}
