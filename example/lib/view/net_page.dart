/// createTime: 2021/10/14 on 11:15
/// desc:
///
/// @author azhon
import 'package:flutter/material.dart';
import 'package:todo_flutter/todo_flutter.dart';
import 'package:todo_flutter_example/domain/bloc/net/net_bloc.dart';
import 'package:todo_flutter_example/domain/bloc/net/net_state.dart';

class NetPage extends StatefulWidget {
  const NetPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NetPageState();
}

class _NetPageState extends BaseState<NetPage> {
  NetBloc get _netBloc => getBloc<NetBloc>();

  @override
  void initState() {
    super.initState();
    addBloc(NetBloc()..setState(this));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('网络示例')),
      body: Column(
        children: [
          CommonButton(
            'Get请求(全屏加载框)',
            width: double.infinity,
            radius: 20,
            margin: all(16),
            onPressed: () {
              _netBloc.get();
            },
          ),
          CommonButton(
            'Post请求(局部加载框)',
            width: double.infinity,
            radius: 20,
            margin: all(16),
            onPressed: () {
              _netBloc.post();
            },
          ),
          SizedBox(
            height: setWidth(300),
            child: BlocLoadWidget(
              loadBloc: _netBloc.loadBloc,
              reload: () => _netBloc.get(),
              child: BlocBuilder<NetBloc, NetState>(
                bloc: _netBloc,
                builder: (_, state) {
                  return CommonText(state.data?.toString() ?? '');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
