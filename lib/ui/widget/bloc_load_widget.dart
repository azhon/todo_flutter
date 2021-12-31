/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    bloc_looad_widget
 * 创建时间:  2021/10/21 on 15:37
 * 描述:     
 *
 * @author   阿钟
 */
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
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadBloc, LoadState>(
      bloc: loadBloc,
      builder: (BuildContext context, LoadState state) {
        if (state is LoadingState) {
          return Container(
            height: setWidth(200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
    if (error != null) return error!;
    return Container(
      height: setWidth(200),
      alignment: Alignment.center,
      child: CommonText('加载失败~'),
    );
  }
}
