/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    bloc_page
 * 创建时间:  2021/9/29 on 16:24
 * 描述:     TODO
 *
 * @author   阿钟
 */
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:todo_flutter/domain/bloc/bloc/test_bloc.dart';
import 'package:todo_flutter/domain/bloc/bloc/test_state.dart';

class BlocPage extends StatefulWidget {
  const BlocPage({Key? key}) : super(key: key);

  @override
  _BlocPageState createState() => _BlocPageState();
}

class _BlocPageState extends BaseState<BlocPage> {
  TestBloc get _bloc => getBloc<TestBloc>();

  @override
  void initState() {
    super.initState();
    addBloc(TestBloc());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bloc示例')),
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
              radius: 20,
              onPressed: () => _bloc.init(),
            ),
          ],
        ),
      ),
    );
  }
}
