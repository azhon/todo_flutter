/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    module_route
 * 创建时间:  2021/9/17 on 18:12
 * 描述:     TODO
 *
 * @author   阿钟
 */
import 'package:flutter_basic_lib/route/router_util.dart';
import 'package:todo_flutter/common/route/module_route_name.dart';
import 'package:todo_flutter/view/bloc_page.dart';
import 'package:todo_flutter/view/button_page.dart';
import 'package:todo_flutter/view/image_page.dart';
import 'package:todo_flutter/view/input_page.dart';
import 'package:todo_flutter/view/net_page.dart';
import 'package:todo_flutter/view/text_page.dart';

class ModuleRoute {
  ///添加模块路由
  void initRoute() {
    RouterUtil.instance.addRoute(ModuleRouteName.TextPage,
        (Map<String, dynamic> map, dynamic obj) {
      return TextPage();
    });
    RouterUtil.instance.addRoute(ModuleRouteName.ButtonPage,
        (Map<String, dynamic> map, dynamic obj) {
      return ButtonPage();
    });
    RouterUtil.instance.addRoute(ModuleRouteName.ImagePage,
        (Map<String, dynamic> map, dynamic obj) {
      return ImagePage();
    });
    RouterUtil.instance.addRoute(ModuleRouteName.InputPage,
        (Map<String, dynamic> map, dynamic obj) {
      return InputPage();
    });
    RouterUtil.instance.addRoute(ModuleRouteName.BlocPage,
        (Map<String, dynamic> map, dynamic obj) {
      return BlocPage();
    });
    RouterUtil.instance.addRoute(ModuleRouteName.NetPage,
        (Map<String, dynamic> map, dynamic obj) {
      return NetPage();
    });
  }
}
