/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    router_util
 * 创建时间:  2021/9/17 on 17:58
 * 描述:
 *
 * @author   阿钟
 */
import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/todo_lib.dart';
import 'package:flutter_basic_lib/route/route_params.dart';
import 'package:flutter_basic_lib/route/routes.dart';

class RouterUtil {
  factory RouterUtil() => _getInstance();

  static RouterUtil get instance => _getInstance();
  static RouterUtil? _instance;

  late FluroRouter _router;

  static RouterUtil _getInstance() {
    if (_instance == null) {
      _instance = RouterUtil._internal();
    }
    return _instance!;
  }

  RouterUtil._internal() {
    _init();
  }

  ///初始化
  void _init() {
    _router = FluroRouter();
    Routes.define(_router);
  }

  ///添加路由
  ///[route] 路由名称
  ///[handler] 路由处理器
  void addRoute(String route, RouteHandler handler) {
    Routes.addRoute(_router, route, handler);
  }

  generator() {
    return _router.generator;
  }

  ///直接跳转
  Future navigate(String route, {RouteParams? params}) {
    return navigateTo(route, params: params);
  }

  ///直接跳转同时接收页面返回值
  Future navigateResult(String route, ValueChanged<RouteParams> result,
      {RouteParams? params}) {
    return navigateTo(route, params: params)
        .then((value) => result(value ?? RouteParams()));
  }

  ///替换当前路由跳转
  Future navigateReplace(String route, {RouteParams? params}) {
    return navigateTo(route, replace: true, params: params);
  }

  ///清除之前所有路由跳转
  Future navigateClear(String route, {RouteParams? params}) {
    return navigateTo(route, clearStack: true, params: params);
  }

  ///清除路由为[untilRoute]之上的路由，然后在打开新的路由[route]
  Future navigatePopUntil(String untilRoute, String route,
      {RouteParams? params}) {
    popUntil(untilRoute);
    return navigateTo(route, params: params);
  }

  ///返回页面
  void pop({RouteParams? result}) {
    Navigator.of(TodoLib.navigatorKey.currentContext!).pop(result);
  }

  ///返回页面直到路由为[untilRoute]时停止
  void popUntil(String untilRoute) {
    Navigator.of(TodoLib.navigatorKey.currentContext!)
        .popUntil((route) => route.settings.name == untilRoute);
  }

  ///跳转
  Future navigateTo(String route,
      {bool replace = false,
      bool clearStack = false,
      bool rootNavigator = false,
      bool maintainState = true,
      TransitionType transition = TransitionType.material,
      RouteParams? params,
      Duration? transitionDuration,
      RouteTransitionsBuilder? transitionBuilder,
      RouteSettings? routeSettings}) {
    if (params != null && params.getObj() != null) {
      routeSettings = RouteSettings(name: route, arguments: params.getObj());
    } else {
      routeSettings = RouteSettings(name: route);
    }
    if (params != null) {
      route = route + params.toUri();
    }
    if (Platform.isIOS) {
      transition = TransitionType.cupertino;
    }
    return _router.navigateTo(TodoLib.navigatorKey.currentContext!, route,
        replace: replace,
        clearStack: clearStack,
        maintainState: maintainState,
        rootNavigator: rootNavigator,
        transition: transition,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        routeSettings: routeSettings);
  }
}
