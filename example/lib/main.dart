import 'package:flutter/material.dart';
import 'package:todo_flutter/todo_flutter.dart';
import 'package:todo_flutter/todo_app.dart';
import 'package:todo_flutter_example/common/route/module_route.dart';
import 'package:todo_flutter_example/generated/route/example_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    TodoApp(
      home: const MyHomePage(),
    ),
  );
  ModuleRoute.initRoute();
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends BaseState<MyHomePage> {
  List<List<String>> routes = [
    ['文本示例', ExampleRoute.textPage],
    ['按钮示例', ExampleRoute.buttonPage],
    ['图片示例', ExampleRoute.imagePage],
    ['Toast示例', ExampleRoute.toastPage],
    ['输入框示例', ExampleRoute.inputPage],
    ['Bloc示例', ExampleRoute.blocPage],
    ['网络示例', ExampleRoute.netPage],
    ['下拉刷新示例', ExampleRoute.refreshPage],
    ['Sliver示例', ExampleRoute.sliverPage],
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
