/// createTime: 2021/9/17 on 17:44
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/base_stateless_widget.dart';
import 'package:todo_flutter/todo_lib.dart';
import 'package:todo_flutter/src/ui/common_text.dart';

class CommonButton extends BaseStatelessWidget {
  final String text;
  final double radius;
  final double? width;
  final double? height;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
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
  final List<String>? fontFamilyFallback;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const CommonButton(
    this.text, {
    Key? key,
    this.color,
    this.width,
    this.height,
    this.radius = 0,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.margin,
    this.padding,
    this.onPressed,
    this.onLongPress,
    this.gradient,
    this.textAlign,
    this.overflow,
    this.borderWidth = 1,
    this.disable = false,
    this.fontFamilyFallback,
    this.borderColor = Colors.transparent,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final double defaultButtonHeight = TodoLib.of(context).buttonHeight;
    final defaultFontFamily = TodoLib.of(context).fontFamily;
    final defaultFontFamilyFallback = TodoLib.of(context).fontFamilyFallback;

    return IgnorePointer(
      ignoring: disable,
      child: Container(
        width: width == null ? null : setWidth(width!),
        height: height == null
            ? (padding == null ? setWidth(defaultButtonHeight) : null)
            : setWidth(height!),
        margin: margin,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(setRadius(radius)),
        ),
        child: TextButton(
          onPressed: () => onPressed?.call(),
          onLongPress: () => onLongPress?.call(),
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: gradient == null ? (color ?? primaryColor) : null,
            side: BorderSide(color: borderColor, width: setWidth(borderWidth)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(setRadius(radius)),
            ),
            minimumSize: Size.zero,
            padding: padding ?? EdgeInsets.zero,
          ),
          child: CommonText(
            text,
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
            textAlign: textAlign,
            overflow: overflow,
            fontFamily: fontFamily ?? defaultFontFamily,
            fontFamilyFallback: fontFamilyFallback ?? defaultFontFamilyFallback,
          ),
        ),
      ),
    );
  }
}
