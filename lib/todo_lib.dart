import 'package:flutter/material.dart';
import 'package:todo_flutter/src/I10n/text_delegate.dart';
import 'package:todo_flutter/src/I10n/text_delegate_en.dart';
import 'package:todo_flutter/src/service/theme/toast_theme_data.dart';

/// createTime: 2021/9/29 on 13:54
/// desc: 框架初始化
///
/// @author azhon

class TodoLib extends InheritedWidget {
  /// 用于导航的key（从而简化跳转需要context）,需要主动进行初始化
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  final TodoLibData? data;

  const TodoLib({
    required Widget child,
    this.data,
    Key? key,
  }) : super(key: key, child: child);

  ///获取库配置数据
  static TodoLibData of(BuildContext context) {
    final TodoLib? todoLib =
        context.dependOnInheritedWidgetOfExactType<TodoLib>();
    if (todoLib == null) {
      throw Exception('Please init [TodoLib] first...');
    }
    return todoLib.data ?? TodoLibData();
  }

  ///获取当前语言
  static TextDelegate delegate(BuildContext context) {
    final locale = Localizations.maybeLocaleOf(context);
    if (locale == null) {
      return const TextDelegate();
    }
    final languageCode = locale.languageCode.toLowerCase();
    return of(context).textDelegates![languageCode] ?? const TextDelegate();
  }

  @override
  bool updateShouldNotify(TodoLib oldWidget) => data != oldWidget.data;
}

class TodoLibData {
  ///默认按钮高度
  final double buttonHeight;

  ///点击事件截流间隔时长 ms
  final int clickInterceptInterval;

  ///输入框提示文本颜色
  final Color placeholderColor;

  ///输入框文本颜色
  final Color inputTextColor;

  ///输入框背景
  final Color inputBackgroundColor;

  ///默认文字大小
  final double textSize;

  ///文本字体
  final String? fontFamily;

  ///toast配置
  ToastThemeData toastThemeData;

  ///解决ios 中文[FontWeight.w500]不起作用bug
  List<String>? fontFamilyFallback;

  ///文本国际化
  Map<String, TextDelegate>? textDelegates;

  ///加载组件
  Widget? loadingWidget;

  TodoLibData({
    this.buttonHeight = 45,
    this.clickInterceptInterval = 1000,
    this.textSize = 14,
    this.placeholderColor = const Color(0xFFC7CCD5),
    this.inputTextColor = const Color(0xFF393C42),
    this.inputBackgroundColor = const Color(0xFFF6F7F9),
    this.toastThemeData = const ToastThemeData(),
    this.fontFamily,
    this.fontFamilyFallback,
    this.loadingWidget,
    this.textDelegates,
  }) {
    textDelegates = _updateTextDelegates(textDelegates);
  }

  ///用户设置的替换原有的
  Map<String, TextDelegate> _updateTextDelegates(
    Map<String, TextDelegate>? textDelegates,
  ) {
    final map = <String, TextDelegate>{
      'zh': const TextDelegate(),
      'en': const TextDelegateEn(),
    };
    textDelegates?.forEach((key, value) {
      map[key] = value;
    });
    return map;
  }
}
