import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:flutter_basic_lib/route/router_util.dart';
import 'package:flutter_basic_lib/ui/common_button.dart';
import 'package:todo_flutter/common/route/module_route.dart';
import 'package:todo_flutter/common/route/module_route_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    //初始化路由
    ModuleRoute().initRoute();
  }

  @override
  Widget build(BuildContext context) {
    //屏幕适配
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      builder: () {
        return TodoLib(
          child: MaterialApp(
            title: 'TODO-Flutter',
            //路由初始化相关
            navigatorKey: TodoLib.navigatorKey,
            onGenerateRoute: RouterUtil.instance.generator(),
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            builder: (BuildContext context, Widget? widget) {
              //设置字体不随系统字体大小进行改变
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget ?? Container(),
              );
            },
            home: MyHomePage(),
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends BaseState<MyHomePage> {
  List<List<String>> routes = [
    ['文本示例', ModuleRouteName.TextPage],
    ['按钮示例', ModuleRouteName.ButtonPage],
    ['图片示例', ModuleRouteName.ImagePage],
    ['输入框示例', ModuleRouteName.InputPage],
    ['Bloc示例', ModuleRouteName.BlocPage],
    ['网络示例', ModuleRouteName.NetPage],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO-Flutter'),
      ),
      body: Padding(
        padding: symmetric(32, 32),
        child: ListView.builder(
          itemCount: routes.length,
          itemBuilder: (context, index) {
            return CommonButton(
              routes[index].first,
              margin: only(bottom: 20),
              radius: 20,
              onPressed: () {
                RouterUtil.instance.navigate(routes[index].last);
              },
            );
          },
        ),
      ),
    );
  }
}
