/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    data_change_widget
 * 创建时间:  2021/9/30 on 10:55
 * 描述:     TODO
 *
 * @author   阿钟
 */
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/base/base_stateless_widget.dart';
import 'package:flutter_basic_lib/bloc/data/data_change_bloc.dart';
import 'package:flutter_basic_lib/bloc/data/data_change_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataChangeWidget<T> extends BaseStatelessWidget {
  final DataChangeBloc<T> bloc;
  final BlocWidgetBuilder<DataChangeState<T>> child;

  DataChangeWidget({
    Key? key,
    required this.bloc,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataChangeBloc<T>, DataChangeState<T>>(
      bloc: bloc,
      builder: (BuildContext context, state) => child.call(context, state),
    );
  }
}
