/// createTime: 2021/9/17 on 17:57
/// desc:
///
/// @author azhon

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

typedef RouteHandler = Widget Function(Map<String, dynamic> map);

class RouteKeyFlag {
  static const String flagString = 'str>';
  static const String flagInt = 'int>';
  static const String flagDouble = 'double>';
  static const String flagBool = 'bool>';
  static const String flagNull = 'null>';
}

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
        resultMap[key] = _parseType(element);
      });
    });
    return resultMap;
  }

  ///数据转型
  static dynamic _parseType(String value) {
    if (value.startsWith(RouteKeyFlag.flagNull)) {
      return null;
    }
    if (value.startsWith(RouteKeyFlag.flagString)) {
      return value.replaceAll(RouteKeyFlag.flagString, '');
    }
    if (value.startsWith(RouteKeyFlag.flagInt)) {
      final intStr = value.replaceAll(RouteKeyFlag.flagInt, '');
      return int.parse(intStr);
    }
    if (value.startsWith(RouteKeyFlag.flagDouble)) {
      final doubleStr = value.replaceAll(RouteKeyFlag.flagDouble, '');
      return double.parse(doubleStr);
    }
    if (value.startsWith(RouteKeyFlag.flagBool)) {
      final boolStr = value.replaceAll(RouteKeyFlag.flagBool, '');
      return boolStr == 'true';
    }
    return value;
  }
}
