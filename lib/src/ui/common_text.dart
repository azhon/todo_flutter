/// createTime: 2021/9/17 on 17:48
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/base_stateless_widget.dart';
import 'package:todo_flutter/todo_lib.dart';

class CommonText extends BaseStatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? height;
  final double? lineHeight;
  final double? letterSpacing;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final FontStyle fontStyle;
  final TextAlign? textAlign;
  final StrutStyle? strutStyle;
  final TextDecorationStyle? decorationStyle;

  const CommonText(
    this.text, {
    Key? key,
    this.fontSize,
    this.color,
    this.fontFamily,
    this.fontWeight,
    this.height,
    this.lineHeight,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
    this.decorationStyle,
    this.overflow,
    this.textAlign,
    this.strutStyle,
    this.fontStyle = FontStyle.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultFonSize = fontSize ?? TodoLib.of(context).textSize;
    final defaultFontFamily = TodoLib.of(context).fontFamily;

    ///calculate height
    double? fontHeight = height;
    if (lineHeight != null) {
      fontHeight = lineHeight! / defaultFonSize;
    }
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      strutStyle: strutStyle,
      style: TextStyle(
        color: color,
        fontSize: setFontSize(defaultFonSize),
        fontFamily: fontFamily ?? defaultFontFamily,
        fontWeight: fontWeight,
        height: fontHeight,
        letterSpacing: letterSpacing,
        decoration: decoration,
        decorationStyle: decorationStyle,
        fontStyle: fontStyle,
      ),
    );
  }
}
