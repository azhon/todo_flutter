/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    net_page
 * 创建时间:  2021/10/14 on 11:15
 * 描述:     TODO
 *
 * @author   阿钟
 */
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/base/base_state.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:todo_flutter/domain/bloc/net/net_bloc.dart';
import 'package:todo_flutter/domain/bloc/net/net_state.dart';

class NetPage extends StatefulWidget {
  const NetPage({Key? key}) : super(key: key);

  @override
  _NetPageState createState() => _NetPageState();
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
      appBar: AppBar(title: Text('网络示例')),
      body: Column(
        children: [
          CommonButton(
            'Get请求(全屏加载框)',
            radius: 20,
            margin: only(right: 40, left: 40, top: 40),
            onPressed: () {
              _netBloc.get();
            },
          ),
          CommonButton(
            'Post请求(局部加载框)',
            radius: 20,
            margin: only(right: 40, left: 40, top: 40),
            onPressed: () {
              _netBloc.post();
            },
          ),
          BlocLoadWidget(
            loadBloc: _netBloc.loadBloc,
            child: BlocBuilder<NetBloc, NetState>(
              bloc: _netBloc,
              builder: (_, state) {
                return CommonText(state.data?.toJson().toString() ?? '');
              },
            ),
          ),
        ],
      ),
    );
  }
}
