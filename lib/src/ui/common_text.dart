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
  final double? letterSpacing;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final FontStyle fontStyle;
  final TextAlign? textAlign;
  final StrutStyle? strutStyle;
  final TextDecorationStyle? decorationStyle;

  CommonText(
    this.text, {
    Key? key,
    this.fontSize,
    this.color,
    this.fontFamily,
    this.fontWeight,
    this.height,
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
    final defaultFonSize = TodoLib.of(context).textSize;
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      strutStyle: strutStyle,
      style: TextStyle(
        color: color,
        fontSize: setFontSize(fontSize ?? defaultFonSize),
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        decoration: decoration,
        decorationStyle: decorationStyle,
        fontStyle: fontStyle,
      ),
    );
  }
}
