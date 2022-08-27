/// createTime: 2021/9/17 on 17:44
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/base/base_stateless_widget.dart';
import 'package:flutter_basic_lib/todo_lib.dart';
import 'package:flutter_basic_lib/base/ui_adapter.dart';
import 'package:flutter_basic_lib/ui/common_text.dart';

class CommonButton extends BaseStatelessWidget {
  final String text;
  final double radius;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color? color;
  final Color? textColor;
  final Color borderColor;
  final bool disable;
  final double borderWidth;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Gradient? gradient;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  CommonButton(
    this.text, {
    Key? key,
    this.color,
    this.width,
    this.height,
    this.radius = 0,
    this.fontSize,
    this.margin,
    this.padding,
    this.onPressed,
    this.onLongPress,
    this.gradient,
    this.borderWidth = 1,
    this.disable = false,
    this.borderColor = Colors.transparent,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    double textSize = TodoLib.of(context).textSize;
    double defaultButtonHeight = TodoLib.of(context).defaultButtonHeight;
    return IgnorePointer(
      ignoring: disable,
      child: GestureDetector(
        onTap: () => onPressed?.call(),
        onLongPress: () => onLongPress?.call(),
        child: Container(
          width: width == null ? null : setWidth(width!),
          height: height == null
              ? (padding == null ? setWidth(defaultButtonHeight) : null)
              : setWidth(height!),
          margin: margin,
          padding: padding,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(setRadius(radius)),
            color: color ?? primaryColor,
            border:
                Border.all(color: borderColor, width: setWidth(borderWidth)),
          ),
          child: Center(
            child: CommonText(
              text,
              color: textColor,
              fontSize: setFontSize(fontSize ?? textSize),
            ),
          ),
        ),
      ),
    );
  }
}
