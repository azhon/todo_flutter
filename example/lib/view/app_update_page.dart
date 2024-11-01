/// createTime: 2021/9/18 on 14:58
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:todo_flutter/todo_flutter.dart';
import 'package:flutter_app_update/flutter_app_update.dart';

class AppUpdatePage extends StatefulWidget {
  const AppUpdatePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppUpdatePageState();
}

class _AppUpdatePageState extends BaseState<AppUpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('版本更新示例')),
      body: Column(
        children: [
          CommonButton(
            '更新',
            width: double.infinity,
            color: Colors.blue,
            radius: 20,
            margin: only(left: 20, right: 20, top: 40),
            onPressed: _showUpdateDialog,
          ),
        ],
      ),
    );
  }

  void _showUpdateDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          title: const Text('发现新版本'),
          content: const Text(
              '1.支持Android4.1及以上版本\n2.支持自定义下载过程\n3.支持通知栏进度条展示\n4.支持文字国际化\n5.使用Kotlin协程重构'),
          actions: <Widget>[
            TextButton(
              child: const Text('取消'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('升级'),
              onPressed: () {
                _appUpdate();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _appUpdate() {
    final UpdateModel model = UpdateModel(
      'http://s.duapps.com/apks/own/ESFileExplorer-cn.apk',
      'flutterUpdate.apk',
      'ic_launcher',
      'https://itunes.apple.com/cn/app/抖音/id1142110895',
    );
    AzhonAppUpdate.update(model).then((value) => debugPrint('$value'));
  }
}
