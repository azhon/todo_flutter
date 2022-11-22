/// createTime: 2021/9/29 on 16:24
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:todo_flutter/todo_flutter.dart';
import 'package:todo_flutter_example/domain/bloc/bloc/test_bloc.dart';
import 'package:todo_flutter_example/domain/bloc/bloc/test_state.dart';

class BlocPage extends StatefulWidget {
  const BlocPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BlocPageState();
}

class _BlocPageState extends BaseState<BlocPage> {
  TestBloc get _bloc => getBloc<TestBloc>();

  @override
  void initState() {
    super.initState();
    addBloc(TestBloc()..setState(this));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc示例')),
      body: Padding(
        padding: all(32),
        child: Column(
          children: [
            BlocBuilder<TestBloc, TestState>(
              bloc: _bloc,
              builder: (BuildContext context, state) {
                return CommonText('通过bloc获取的数据：${state.data}');
              },
            ),
            CommonButton(
              'Bloc获取数据',
              margin: only(top: 16, bottom: 16),
              radius: 20,
              onPressed: () => _bloc.init(),
            ),
            DataChangeWidget<int>(
              bloc: _bloc.dataChangeBloc,
              child: (context, state) {
                return CommonText('简单Bloc：$state');
              },
            ),
            CommonButton(
              '简单Bloc获取数据',
              margin: only(top: 16),
              radius: 20,
              onPressed: () => _bloc.changeData(),
            ),
          ],
        ),
      ),
    );
  }
}
