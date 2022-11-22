import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:flutter_basic_lib/todo_app.dart';
import 'package:todo_flutter/common/route/module_route.dart';
import 'package:todo_flutter/generated/route/todo_flutter_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(TodoApp(home: const MyHomePage()));
  ModuleRoute.initRoute();
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends BaseState<MyHomePage> {
  List<List<String>> routes = [
    ['文本示例', TodoFlutterRoute.textPage],
    ['按钮示例', TodoFlutterRoute.buttonPage],
    ['图片示例', TodoFlutterRoute.imagePage],
    ['Toast示例', TodoFlutterRoute.toastPage],
    ['输入框示例', TodoFlutterRoute.inputPage],
    ['Bloc示例', TodoFlutterRoute.blocPage],
    ['网络示例', TodoFlutterRoute.netPage],
    ['下拉刷新示例', TodoFlutterRoute.refreshPage],
    ['Sliver示例', TodoFlutterRoute.sliverPage],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO-Flutter'),
      ),
      body: Padding(
        padding: symmetric(16, 16),
        child: ListView.builder(
          itemCount: routes.length,
          itemBuilder: (context, index) {
            return CommonButton(
              routes[index].first,
              margin: only(bottom: 10),
              radius: 10,
              onPressed: () {
                RouterUtil.instance
                    .build(routes[index].last)
                    .withString('key-s', null)
                    .withBool('key-b', false)
                    .withNum('key-n', 3)
                    .navigate();
              },
            );
          },
        ),
      ),
    );
  }
}
