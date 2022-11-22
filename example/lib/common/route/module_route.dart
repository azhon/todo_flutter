/// createTime: 2021/9/17 on 18:12
/// desc:
///
/// @author azhon
import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:todo_flutter/generated/route/todo_flutter_route.dart';
import 'package:todo_flutter/view/bloc_page.dart';
import 'package:todo_flutter/view/button_page.dart';
import 'package:todo_flutter/view/image_page.dart';
import 'package:todo_flutter/view/input_page.dart';
import 'package:todo_flutter/view/net_page.dart';
import 'package:todo_flutter/view/refresh_page.dart';
import 'package:todo_flutter/view/sliver_page.dart';
import 'package:todo_flutter/view/text_page.dart';
import 'package:todo_flutter/view/toast_page.dart';

class ModuleRoute {
  ///添加模块路由
  static void initRoute() {
    RouterUtil.instance.addRoute(TodoFlutterRoute.textPage,
        (Map<String, dynamic> map) {
      return TextPage();
    });
    RouterUtil.instance.addRoute(TodoFlutterRoute.buttonPage,
        (Map<String, dynamic> map) {
      return ButtonPage();
    });
    RouterUtil.instance.addRoute(TodoFlutterRoute.imagePage,
        (Map<String, dynamic> map) {
      return ImagePage();
    });
    RouterUtil.instance.addRoute(TodoFlutterRoute.toastPage,
        (Map<String, dynamic> map) {
      return const ToastPage();
    });
    RouterUtil.instance.addRoute(TodoFlutterRoute.inputPage,
        (Map<String, dynamic> map) {
      return InputPage();
    });
    RouterUtil.instance.addRoute(TodoFlutterRoute.blocPage,
        (Map<String, dynamic> map) {
      return const BlocPage();
    });
    RouterUtil.instance.addRoute(TodoFlutterRoute.netPage,
        (Map<String, dynamic> map) {
      return const NetPage();
    });
    RouterUtil.instance.addRoute(TodoFlutterRoute.refreshPage,
        (Map<String, dynamic> map) {
      return const RefreshPage();
    });
    RouterUtil.instance.addRoute(TodoFlutterRoute.sliverPage,
        (Map<String, dynamic> map) {
      return const SliverPage();
    });
  }
}
