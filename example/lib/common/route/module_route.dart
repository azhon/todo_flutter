import 'package:todo_flutter/todo_flutter.dart';
import 'package:todo_flutter_example/generated/route/example_route.dart';
import 'package:todo_flutter_example/view/bloc_page.dart';
import 'package:todo_flutter_example/view/button_page.dart';
import 'package:todo_flutter_example/view/dialog_page.dart';
import 'package:todo_flutter_example/view/image_page.dart';
import 'package:todo_flutter_example/view/input_page.dart';
import 'package:todo_flutter_example/view/net_page.dart';
import 'package:todo_flutter_example/view/refresh_page.dart';
import 'package:todo_flutter_example/view/sliver_page.dart';
import 'package:todo_flutter_example/view/text_page.dart';
import 'package:todo_flutter_example/view/toast_page.dart';

/// createTime: 2021/9/17 on 18:12
/// desc:
///
/// @author azhon

class ModuleRoute {
  ///添加模块路由
  static void initRoute() {
    RouterUtil.instance.addRoute(ExampleRoute.textPage,
        (Map<String, dynamic> map) {
      return const TextPage();
    });
    RouterUtil.instance.addRoute(ExampleRoute.buttonPage,
        (Map<String, dynamic> map) {
      return const ButtonPage();
    });
    RouterUtil.instance.addRoute(ExampleRoute.imagePage,
        (Map<String, dynamic> map) {
      return const ImagePage();
    });
    RouterUtil.instance.addRoute(ExampleRoute.toastPage,
        (Map<String, dynamic> map) {
      return const ToastPage();
    });
    RouterUtil.instance.addRoute(ExampleRoute.inputPage,
        (Map<String, dynamic> map) {
      return const InputPage();
    });
    RouterUtil.instance.addRoute(ExampleRoute.dialogPage,
        (Map<String, dynamic> map) {
      return const DialogPage();
    });
    RouterUtil.instance.addRoute(ExampleRoute.blocPage,
        (Map<String, dynamic> map) {
      return const BlocPage();
    });
    RouterUtil.instance.addRoute(ExampleRoute.netPage,
        (Map<String, dynamic> map) {
      return const NetPage();
    });
    RouterUtil.instance.addRoute(ExampleRoute.refreshPage,
        (Map<String, dynamic> map) {
      return const RefreshPage();
    });
    RouterUtil.instance.addRoute(ExampleRoute.sliverPage,
        (Map<String, dynamic> map) {
      return const SliverPage();
    });
  }
}
