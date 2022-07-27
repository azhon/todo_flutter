/// createTime: 2021/9/17 on 17:48
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

class CommonText extends BaseStatelessWidget with UIAdapter {
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
    this.fontStyle = FontStyle.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var defaultFonSize = TodoLib.of(context).textSize;
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
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
