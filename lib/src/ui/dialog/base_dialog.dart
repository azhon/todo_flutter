import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/ui_widget.dart';
import 'package:todo_flutter/src/service/route/bundle.dart';
import 'package:todo_flutter/src/service/route/router_util.dart';
import 'package:todo_flutter/src/ui/common_button.dart';
import 'package:todo_flutter/src/ui/common_text.dart';
import 'package:todo_flutter/src/ui/widget/remove_ripple_widget.dart';

/// createTime: 2023/2/23 on 15:55
/// desc:
///
/// @author azhon
mixin BaseDialog implements UIWidget {
  ///基础对话框
  ///[message] 提示内容
  ///[title] 标题
  ///[radius] 圆角
  ///[margin] 左右边距
  ///[confirmWidget] 右边按钮
  ///[cancelWidget] 左边按钮
  ///[elevation] 阴影
  ///[singleButton] 是否是一个按钮
  ///[canceledOutside] 点击对话框外是否可以关闭
  ///[backgroundColor] 背景颜色
  ///[messageMaxHeight] 消息内容最大高度，超过滚动
  Future<bool> baseDialog(
    BuildContext context, {
    required String message,
    String? title,
    double? radius,
    EdgeInsets? margin,
    Widget? confirmWidget,
    Widget? cancelWidget,
    double elevation = 0,
    bool singleButton = false,
    bool canceledOutside = true,
    Color backgroundColor = Colors.white,
    double messageMaxHeight = 120,
  }) async {
    final sw = MediaQuery.of(context).size.width;
    margin = margin ?? symmetric(0, 100);
    radius = radius ?? setRadius(8);
    final result = await showDialog<Bundle>(
      context: context,
      builder: (_) {
        return WillPopScope(
          onWillPop: () => Future.value(canceledOutside),
          child: UnconstrainedBox(
            child: Dialog(
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              elevation: elevation,
              child: Container(
                width: sw - (margin!.left + margin.right),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(radius!),
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
                    Padding(
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
                    Divider(
                      height: setWidth(1),
                      color: const Color(0xFFEEEEEE),
                    ),
                    _buildButton(singleButton, confirmWidget, cancelWidget)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    return result!.getBool('result')!;
  }

  ///俩个按钮还是一个按钮
  Widget _buildButton(
    bool singleButton,
    Widget? confirmWidget,
    Widget? cancelWidget,
  ) {
    if (singleButton) {
      return Row(
        children: [
          confirmWidget ??
              buttonWidget(
                '确定',
                Colors.blue,
              )
        ],
      );
    }
    return Row(
      children: [
        cancelWidget ??
            buttonWidget(
              '取消',
              const Color(0xFF666666),
              result: false,
            ),
        Container(
          width: setWidth(1),
          height: setWidth(45),
          color: const Color(0xFFEEEEEE),
        ),
        confirmWidget ??
            buttonWidget(
              '确定',
              Colors.blue,
            ),
      ],
    );
  }

  ///
  Widget buttonWidget(
    String text,
    Color color, {
    double fontSize = 16,
    bool result = true,
  }) {
    return Expanded(
      child: CommonButton(
        text,
        fontSize: fontSize,
        height: setWidth(45),
        textColor: color,
        color: Colors.transparent,
        onPressed: () {
          final bundle = Bundle()..withBool('result', result);
          RouterUtil.instance.pop(bundle);
        },
      ),
    );
  }
}
