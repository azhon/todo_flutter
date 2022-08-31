import 'dart:collection';

import 'package:flutter/material.dart';

/// createTime: 2022/8/30 on 11:41
/// desc:
///
/// @author azhon
class RouterHistoryStack {
  final Queue<String> _queue = Queue();

  factory RouterHistoryStack() => _getInstance();

  RouterHistoryStack._internal();

  static RouterHistoryStack get instance => _getInstance();
  static RouterHistoryStack? _instance;

  static RouterHistoryStack _getInstance() {
    _instance ??= RouterHistoryStack._internal();
    return _instance!;
  }

  void _push(String route) {
    _queue.add(route);
  }

  void _replace(String newRoute, String oldRoute) {
    _pop(oldRoute);
    _push(newRoute);
  }

  void _pop(String route) {
    _queue.removeLast();
  }

  ///获取栈底路由
  String get firstRoute => _queue.first;

  ///获取栈顶路由
  String get lastRoute => _queue.last;

  ///栈中是否存在当前[route]路由
  bool exist(String route) => _queue.contains(route);

  ///获取当前[route]路由存在多少个
  int count(String route) {
    return _queue.where((element) => element == route).length;
  }

  @override
  String toString() {
    return _queue.join(' -> ');
  }
}

class RouterHistoryObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    RouterHistoryStack.instance._push(route.settings.name ?? '');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    RouterHistoryStack.instance._replace(
      newRoute?.settings.name ?? '',
      oldRoute?.settings.name ?? '',
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    RouterHistoryStack.instance._pop(route.settings.name ?? '');
  }
}
