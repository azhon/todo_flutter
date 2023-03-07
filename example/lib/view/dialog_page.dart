/// createTime: 2023/2/23 on 15:51
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:todo_flutter/todo_flutter.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DialogPageState();
}

class _DialogPageState extends BaseState<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog示例')),
      body: Padding(
        padding: symmetric(16, 16),
        child: Column(
          children: [
            CommonButton(
              '提示对话框',
              margin: only(bottom: 10),
              radius: 10,
              onPressed: () {
                CommonDialog.instance.tipDialog(context, '提示', '你确定要这么操作吗' * 5);
              },
            ),
            CommonButton(
              '提示对话框内存超长',
              margin: only(bottom: 10),
              radius: 10,
              onPressed: () {
                CommonDialog.instance
                    .tipDialog(context, '提示', '你确定要这么操作吗' * 50);
              },
            ),
            CommonButton(
              '无标题对话框',
              margin: only(bottom: 10),
              radius: 10,
              onPressed: () {
                CommonDialog.instance.tipDialog(context, null, '你确定要这么操作吗' * 5);
              },
            ),
            CommonButton(
              '单按钮对话框',
              margin: only(bottom: 10),
              radius: 10,
              onPressed: () {
                CommonDialog.instance
                    .singleButtonDialog(context, '提示', '你确定要这么操作吗' * 5);
              },
            ),
            CommonButton(
              '输入框对话框',
              margin: only(bottom: 10),
              radius: 10,
              onPressed: () {
                CommonDialog.instance.inputDialog(
                  context,
                  '请输入密码',
                  placeholder: '请输入密码',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
