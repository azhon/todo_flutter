import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/ui_widget.dart';
import 'package:todo_flutter/src/service/route/bundle.dart';
import 'package:todo_flutter/src/service/route/router_util.dart';
import 'package:todo_flutter/src/ui/common_button.dart';
import 'package:todo_flutter/src/ui/common_input.dart';
import 'package:todo_flutter/src/ui/common_text.dart';
import 'package:todo_flutter/src/ui/widget/remove_ripple_widget.dart';
import 'package:todo_flutter/todo_lib.dart';

/// createTime: 2023/2/23 on 15:55
/// desc:
///
/// @author azhon
mixin BaseDialog implements UIWidget {
  ///基础对话框
  ///[message] 提示内容
  ///[name] 对话框的名称
  ///[title] 标题
  ///[radius] 圆角
  ///[margin] 左右边距
  ///[elevation] 阴影
  ///[singleButton] 是否是一个按钮
  ///[canceledOutside] 点击对话框外是否可以关闭
  ///[confirmText] 右边按钮文本
  ///[confirmColor] 右边按钮文本颜色
  ///[cancelText] 左边按钮文本
  ///[cancelColor] 左边按钮文本颜色
  ///[backgroundColor] 背景颜色
  ///[messageMaxHeight] 消息内容最大高度，超过滚动
  Future<bool?> baseDialog(
    BuildContext context, {
    required String message,
    String? name,
    String? title,
    double? radius,
    EdgeInsets? margin,
    double elevation = 0,
    bool singleButton = false,
    bool canceledOutside = true,
    String? confirmText,
    Color confirmColor = Colors.blue,
    String? cancelText,
    Color cancelColor = const Color(0xFF666666),
    double messageMaxHeight = 120,
    Color backgroundColor = Colors.white,
  }) async {
    confirmText = confirmText ?? TodoLib.delegate(context).dialogConfirm;
    cancelText = cancelText ?? TodoLib.delegate(context).dialogCancel;
    margin = margin ?? symmetric(horizontal: 100);
    radius = radius ?? setRadius(8);
    final result = await showDialog<Bundle>(
      context: context,
      routeSettings: RouteSettings(name: name),
      builder: (_) {
        return WillPopScope(
          onWillPop: () => Future.value(canceledOutside),
          child: _commonContent(
            context,
            title: title,
            confirmText: confirmText!,
            confirmColor: confirmColor,
            cancelText: cancelText!,
            cancelColor: cancelColor,
            elevation: elevation,
            singleButton: singleButton,
            backgroundColor: backgroundColor,
            radius: radius,
            margin: margin,
            content: Padding(
              padding: only(left: 16, right: 16, top: 16, bottom: 12),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: setWidth(messageMaxHeight),
                ),
                child: RemoveRippleWidget(
                  child: SingleChildScrollView(
                    child: CommonText(
                      message,
                      color: const Color(0xFF333333),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    return result?.getBool('result');
  }

  ///基础输入框对话框
  ///[name] 对话框的名称
  ///[title] 标题
  ///[radius] 圆角
  ///[margin] 左右边距
  ///[elevation] 阴影
  ///[singleButton] 是否是一个按钮
  ///[canceledOutside] 点击对话框外是否可以关闭
  ///[obscureText] 是否隐藏输入内容
  ///[confirmText] 右边按钮文本
  ///[confirmColor] 右边按钮文本颜色
  ///[cancelText] 左边按钮文本
  ///[cancelColor] 左边按钮文本颜色
  ///[backgroundColor] 背景颜色
  Future<String?> baseInputDialog(
    BuildContext context, {
    String? name,
    String? title,
    double? radius,
    EdgeInsets? margin,
    double elevation = 0,
    String placeholder = '',
    bool singleButton = false,
    bool canceledOutside = true,
    bool obscureText = false,
    String? confirmText,
    Color confirmColor = Colors.blue,
    String? cancelText,
    Color cancelColor = const Color(0xFF666666),
    Color backgroundColor = Colors.white,
  }) async {
    confirmText = confirmText ?? TodoLib.delegate(context).dialogConfirm;
    cancelText = cancelText ?? TodoLib.delegate(context).dialogCancel;
    final controller = TextEditingController();
    final result = await showDialog<Bundle>(
      context: context,
      routeSettings: RouteSettings(name: name),
      builder: (_) {
        return WillPopScope(
          onWillPop: () => Future.value(canceledOutside),
          child: _commonContent(
            context,
            title: title,
            radius: radius,
            margin: margin,
            confirmText: confirmText!,
            confirmColor: confirmColor,
            cancelText: cancelText!,
            cancelColor: cancelColor,
            elevation: elevation,
            singleButton: singleButton,
            backgroundColor: backgroundColor,
            content: Padding(
              padding: only(left: 16, right: 16, top: 16, bottom: 12),
              child: CommonInput(
                placeholder: placeholder,
                controller: controller,
                obscureText: obscureText,
                maxLines: obscureText ? 1 : null,
                padding: symmetric(vertical: 10, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(setRadius(4)),
                  border: Border.all(
                    color: const Color(0xFFECEEF2),
                    width: setWidth(1),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    final text = controller.text;
    controller.dispose();
    final r = result?.getBool('result');
    if (r == null) {
      return null;
    }
    return r ? text : '';
  }

  ///对话框内核心组件
  Widget _commonContent(
    BuildContext context, {
    required Widget content,
    required String confirmText,
    required Color confirmColor,
    required String cancelText,
    required Color cancelColor,
    required double elevation,
    required bool singleButton,
    required Color backgroundColor,
    String? title,
    double? radius,
    EdgeInsets? margin,
  }) {
    final sw = MediaQuery.of(context).size.width;
    margin = margin ?? symmetric(horizontal: 100);
    radius = radius ?? setRadius(8);
    return UnconstrainedBox(
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        elevation: elevation,
        child: Container(
          width: sw - (margin.left + margin.right),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Column(
            children: [
              Offstage(
                offstage: title == null,
                child: Padding(
                  padding: only(top: 12),
                  child: CommonText(
                    title ?? '',
                    fontSize: 16,
                    maxLines: 1,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              content,
              Divider(
                height: setWidth(1),
                color: const Color(0xFFEEEEEE),
              ),
              _buildButton(
                singleButton,
                confirmText,
                confirmColor,
                cancelText,
                cancelColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///俩个按钮还是一个按钮
  Widget _buildButton(
    bool singleButton,
    String confirmText,
    Color confirmColor,
    String cancelText,
    Color cancelColor,
  ) {
    if (singleButton) {
      return Row(
        children: [
          _buttonWidget(confirmText, confirmColor),
        ],
      );
    }
    return Row(
      children: [
        _buttonWidget(cancelText, cancelColor, result: false),
        Container(
          width: setWidth(1),
          height: setWidth(40),
          color: const Color(0xFFEEEEEE),
        ),
        _buttonWidget(confirmText, confirmColor),
      ],
    );
  }

  ///
  Widget _buttonWidget(
    String text,
    Color color, {
    double fontSize = 16,
    bool result = true,
  }) {
    return Expanded(
      child: CommonButton(
        text,
        fontSize: fontSize,
        height: setWidth(40),
        textColor: color,
        color: Colors.transparent,
        onPressed: () {
          RouterUtil.instance.build().withBool('result', result).pop();
        },
      ),
    );
  }
}
