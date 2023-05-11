/// createTime: 2021/9/30 on 10:55
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/base_stateless_widget.dart';
import 'package:todo_flutter/src/bloc/data/data_change_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataChangeWidget<T> extends BaseStatelessWidget {
  final DataChangeBloc<T> bloc;
  final BlocWidgetBuilder<T?> child;

  const DataChangeWidget({
    required this.bloc,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataChangeBloc<T>, T?>(
      bloc: bloc,
      builder: child.call,
    );
  }
}
