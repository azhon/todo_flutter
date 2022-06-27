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
import 'package:flutter_basic_lib/route/bundle.dart';
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

  Bundle build(String route) {
    return Bundle(route);
  }

  ///直接跳转
  Future navigate(Bundle bundle) {
    return navigateTo(bundle);
  }

  ///替换当前路由跳转
  Future navigateReplace(Bundle bundle) {
    return navigateTo(bundle, replace: true);
  }

  ///清除之前所有路由跳转
  Future navigateClear(Bundle bundle) {
    return navigateTo(bundle, clearStack: true);
  }

  ///清除路由为[untilRoute]之上的路由，然后在打开新的路由[route]
  Future navigatePopUntil(Bundle bundle, String untilRoute) {
    popUntil(untilRoute);
    return navigate(bundle);
  }

  ///直接跳转同时接收页面返回值
  Future navigateResult(Bundle bundle, ValueChanged<RouteParams> result) {
    return navigateTo(bundle).then((value) => result(value ?? RouteParams()));
  }

  ///返回页面
  void pop([RouteParams? result]) {
    Navigator.of(TodoLib.navigatorKey.currentContext!).pop(result);
  }

  ///返回页面直到路由为[untilRoute]时停止
  void popUntil(String untilRoute) {
    Navigator.of(TodoLib.navigatorKey.currentContext!)
        .popUntil((route) => route.settings.name == untilRoute);
  }

  ///跳转
  Future navigateTo(Bundle bundle,
      {bool replace = false,
      bool clearStack = false,
      bool rootNavigator = false,
      bool maintainState = true,
      TransitionType transition = TransitionType.material,
      Duration? transitionDuration,
      RouteTransitionsBuilder? transitionBuilder,
      RouteSettings? routeSettings}) {
    routeSettings = RouteSettings(name: bundle.route);

    var route = bundle.route + bundle.toUri();
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
