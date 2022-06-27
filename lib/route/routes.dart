/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    routes
 * 创建时间:  2021/9/17 on 17:57
 * 描述:
 *
 * @author   阿钟
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/route/route_params.dart';

typedef RouteHandler = Widget Function(Map<String, dynamic> map);

class Routes {
  ///定义路由
  static void define(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return Scaffold(
          body: Center(
            child: Text("页面找不到了"),
          ),
        );
      },
    );
  }

  static void addRoute(FluroRouter router, String route, RouteHandler handler) {
    router.define(route, handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> map) {
        return handler.call(convertType(map));
      },
    ));
  }

  static Map<String, dynamic> convertType(Map<String, List<String>> map) {
    Map<String, dynamic> resultMap = {};
    map.forEach((key, value) {
      value.forEach((element) {
        resultMap[key] = parseType(element);
      });
    });
    return resultMap;
  }

  ///数据转型
  static dynamic parseType(String value) {
    if (value.startsWith(RouteParams.FLAG_STRING)) {
      return value.replaceAll(RouteParams.FLAG_STRING, '');
    }
    if (value.startsWith(RouteParams.FLAG_INT)) {
      var intStr = value.replaceAll(RouteParams.FLAG_INT, '');
      return int.parse(intStr);
    }
    if (value.startsWith(RouteParams.FLAG_DOUBLE)) {
      var doubleStr = value.replaceAll(RouteParams.FLAG_DOUBLE, '');
      return double.parse(doubleStr);
    }
    if (value.startsWith(RouteParams.FLAG_BOOL)) {
      var boolStr = value.replaceAll(RouteParams.FLAG_BOOL, '');
      return boolStr == 'true';
    }
    return value;
  }
}
