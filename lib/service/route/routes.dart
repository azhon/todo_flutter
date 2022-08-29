/// createTime: 2021/9/17 on 17:57
/// desc:
///
/// @author azhon

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/service/route/route_params.dart';

typedef RouteHandler = Widget Function(Map<String, dynamic> map);

class Routes {
  ///定义路由
  static void define(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return const Scaffold(
          body: Center(
            child: Text('页面找不到了'),
          ),
        );
      },
    );
  }

  static void addRoute(FluroRouter router, String route, RouteHandler handler) {
    router.define(
      route,
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> map) {
          return handler.call(convertType(map));
        },
      ),
    );
  }

  static Map<String, dynamic> convertType(Map<String, List<String>> map) {
    final Map<String, dynamic> resultMap = {};
    map.forEach((key, value) {
      value.forEach((element) {
        resultMap[key] = parseType(element);
      });
    });
    return resultMap;
  }

  ///数据转型
  static dynamic parseType(String value) {
    if (value.startsWith(RouteParams.flagString)) {
      return value.replaceAll(RouteParams.flagString, '');
    }
    if (value.startsWith(RouteParams.flagInt)) {
      final intStr = value.replaceAll(RouteParams.flagInt, '');
      return int.parse(intStr);
    }
    if (value.startsWith(RouteParams.flagDouble)) {
      final doubleStr = value.replaceAll(RouteParams.flagDouble, '');
      return double.parse(doubleStr);
    }
    if (value.startsWith(RouteParams.flagBool)) {
      final boolStr = value.replaceAll(RouteParams.flagBool, '');
      return boolStr == 'true';
    }
    return value;
  }
}
