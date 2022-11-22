/// createTime: 2021/9/18 on 14:58
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

class ToastPage extends StatefulWidget {
  const ToastPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ToastPageState();
}

class _ToastPageState extends BaseState<ToastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Toast示例')),
      body: Column(
        children: [
          CommonButton(
            '弹出Toast',
            color: Colors.blue,
            radius: 20,
            margin: only(left: 20, right: 20, top: 40),
            onPressed: () {
              showToast('我是Toast');
            },
          ),
          CommonButton(
            'Toast居于底部',
            color: Colors.blue,
            radius: 20,
            margin: only(left: 20, right: 20, top: 20),
            onPressed: () {
              showToast(
                '底部Toast',
                data: const ToastThemeData(gravity: ToastGravity.BOTTOM),
              );
            },
          ),
        ],
      ),
    );
  }
}
