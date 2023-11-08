import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_flutter/todo_flutter.dart';
import 'package:todo_flutter/todo_app.dart';
import 'package:todo_flutter_example/common/route/module_route.dart';
import 'package:todo_flutter_example/generated/route/example_route.dart';
import 'package:network_capture/network_capture.dart';

GlobalKey<NavigatorState> naviKey = GlobalKey();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    NetworkCaptureApp(
      navigatorKey: naviKey,
      child: TodoApp(
        home: const MyHomePage(),
        navigatorKey: naviKey,
      ),
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
    ['Dialog示例', ExampleRoute.dialogPage],
    ['Bloc示例', ExampleRoute.blocPage],
    ['网络示例', ExampleRoute.netPage],
    ['下拉刷新示例', ExampleRoute.refreshPage],
    ['版本更新示例', ExampleRoute.appUpdatePage],
    ['Sliver示例', ExampleRoute.sliverPage],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO-Flutter'),
      ),
      body: GridView.builder(
        itemCount: routes.length,
        padding: all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.2,
          mainAxisSpacing: setWidth(16),
          crossAxisSpacing: setWidth(16),
        ),
        itemBuilder: (_, index) {
          final item = routes[index];
          return CommonClickWidget(
            singleClick: () {
              RouterUtil.instance
                  .build(routes[index].last)
                  .withString('key-s', null)
                  .withBool('key-b', false)
                  .withNum('key-n', 3)
                  .navigate();
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromRGBO(
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                  1,
                ),
                borderRadius: BorderRadius.circular(setRadius(10)),
              ),
              child: CommonText(
                item.first,
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }
}
