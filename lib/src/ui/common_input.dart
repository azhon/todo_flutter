/// createTime: 2021/9/27 on 15:33
/// desc:
///
/// @author azhon

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_flutter/todo_lib.dart';
import 'package:todo_flutter/src/base/base_stateless_widget.dart';

class CommonInput extends BaseStatelessWidget {
  final EdgeInsetsGeometry? padding;
  final String placeholder;
  final double? placeholderFontSize;
  final Color? placeholderColor;
  final double? fontSize;
  final Color? color;
  final BoxDecoration? decoration;
  final int? maxLength;
  final int? maxLines;
  final bool autofocus;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;
  final bool readOnly;
  final bool enable;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final String obscuringCharacter;
  final FontWeight? fontWeight;
  final FontWeight? placeholderFontWeight;
  final TextEditingController? controller;
  final ValueChanged<String>? onTextChange;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final OverlayVisibilityMode prefixMode;
  final OverlayVisibilityMode suffixMode;
  final bool enableInteractiveSelection;

  const CommonInput({
    Key? key,
    this.controller,
    this.padding,
    this.placeholder = '请输入内容',
    this.placeholderFontSize,
    this.placeholderColor,
    this.fontSize,
    this.color,
    this.decoration,
    this.maxLength,
    this.maxLines,
    this.autofocus = false,
    this.obscureText = false,
    this.readOnly = false,
    this.enable = true,
    this.prefix,
    this.suffix,
    this.inputFormatters,
    this.obscuringCharacter = '•',
    this.onSubmitted,
    this.focusNode,
    this.onTextChange,
    this.fontWeight,
    this.placeholderFontWeight,
    this.textAlign = TextAlign.start,
    this.prefixMode = OverlayVisibilityMode.always,
    this.suffixMode = OverlayVisibilityMode.always,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.text,
    this.enableInteractiveSelection = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTextSize = TodoLib.of(context).textSize;
    final defaultPlaceholderColor = TodoLib.of(context).placeholderColor;
    final defaultInputTextColor = TodoLib.of(context).inputTextColor;
    return IgnorePointer(
      ignoring: !enable,
      child: CupertinoTextField(
        controller: controller,
        focusNode: focusNode,
        padding: padding ?? symmetric(vertical: 10),
        placeholder: placeholder,
        decoration: decoration ??
            BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xFFEEEEEE),
                  width: setWidth(1),
                ),
              ),
            ),
        style: TextStyle(
          color: color ?? defaultInputTextColor,
          fontSize: setFontSize(fontSize ?? defaultTextSize),
        ),
        placeholderStyle: TextStyle(
          color: placeholderColor ?? defaultPlaceholderColor,
          fontSize: setFontSize(placeholderFontSize ?? defaultTextSize),
        ),
        onChanged: (text) => onTextChange?.call(text),
        cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
        textAlign: textAlign,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        obscuringCharacter: obscuringCharacter,
        onSubmitted: onSubmitted,
        maxLength: maxLength,
        maxLines: maxLines,
        autofocus: autofocus,
        readOnly: readOnly,
        prefix: prefix,
        suffix: suffix,
        prefixMode: prefixMode,
        suffixMode: suffixMode,
        enableInteractiveSelection: enableInteractiveSelection,
      ),
    );
  }
}
