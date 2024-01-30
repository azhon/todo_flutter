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
        padding: all(16),
        child: Column(
          children: [
            CommonButton(
              '等待对话框',
              width: double.infinity,
              margin: only(bottom: 10),
              radius: 10,
              onPressed: () {
                LoadingDialog.show(msg: '请稍后...');
                Future.delayed(const Duration(seconds: 2)).then((value) {
                  LoadingDialog.show();
                });
                Future.delayed(const Duration(seconds: 4)).then((value) {
                  LoadingDialog.dismiss();
                });
              },
            ),
            CommonButton(
              '提示对话框',
              width: double.infinity,
              margin: only(bottom: 10),
              radius: 10,
              onPressed: () {
                CommonDialog.instance.tipDialog(context, '提示', '你确定要这么操作吗' * 5);
              },
            ),
            CommonButton(
              '提示对话框内存超长',
              width: double.infinity,
              margin: only(bottom: 10),
              radius: 10,
              onPressed: () {
                CommonDialog.instance
                    .tipDialog(context, '提示', '你确定要这么操作吗' * 50);
              },
            ),
            CommonButton(
              '无标题对话框',
              width: double.infinity,
              margin: only(bottom: 10),
              radius: 10,
              onPressed: () {
                CommonDialog.instance.tipDialog(context, null, '你确定要这么操作吗' * 5);
              },
            ),
            CommonButton(
              '单按钮对话框',
              width: double.infinity,
              margin: only(bottom: 10),
              radius: 10,
              onPressed: () {
                CommonDialog.instance
                    .singleButtonDialog(context, '提示', '你确定要这么操作吗' * 5);
              },
            ),
            CommonButton(
              '输入框对话框',
              width: double.infinity,
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
