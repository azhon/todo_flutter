import 'dart:collection';

import 'package:flutter/material.dart';

/// createTime: 2022/8/30 on 11:41
/// desc:
///
/// @author azhon
class RouterHistoryStack {
  final Queue<Route> _queue = Queue();

  factory RouterHistoryStack() => _getInstance();

  RouterHistoryStack._internal();

  static RouterHistoryStack get instance => _getInstance();
  static RouterHistoryStack? _instance;

  static RouterHistoryStack _getInstance() {
    _instance ??= RouterHistoryStack._internal();
    return _instance!;
  }

  void _push(Route route) {
    _queue.add(route);
  }

  void _replace(Route newRoute, Route oldRoute) {
    _pop(oldRoute);
    _push(newRoute);
  }

  void _pop(Route route) {
    _queue.removeWhere((element) => element == route);
  }

  ///获取栈底路由
  Route get firstRoute => _queue.first;

  ///获取栈顶路由
  Route get lastRoute => _queue.last;

  ///栈中是否存在当前[route]路由
  bool exist(String route) {
    return _queue
        .where((element) => (element.settings.name ?? '') == route)
        .isNotEmpty;
  }

  ///获取当前[route]路由存在多少个
  int count(String route) {
    return _queue
        .where((element) => (element.settings.name ?? '') == route)
        .length;
  }

  ///根据[route]路由名称，获取对应路由；同时从历史栈中删除
  Route? get(String route) {
    final list =
        _queue.where((element) => (element.settings.name ?? '') == route);
    if (list.isNotEmpty) {
      final r = list.first;
      _pop(r);
      return r;
    }
    return null;
  }

  @override
  String toString() {
    int line = 1;
    String result = '';
    _queue.forEach((element) {
      final settings = element.settings;
      result += '${'-' * line}>RouteSettings("${settings.name}", '
          '${settings.arguments})\n';
      line++;
    });
    return result;
  }
}

class RouterHistoryObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    RouterHistoryStack.instance._push(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    RouterHistoryStack.instance._replace(newRoute!, oldRoute!);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    RouterHistoryStack.instance._pop(route);
  }
}
