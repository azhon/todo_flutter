/// createTime: 2021/9/27 on 15:33
/// desc:
///
/// @author azhon

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

class CommonInput extends BaseStatefulWidget {
  final String text;
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
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final String obscuringCharacter;
  final ValueChanged<String>? onTextChange;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final OverlayVisibilityMode prefixMode;
  final OverlayVisibilityMode suffixMode;

  CommonInput({
    Key? key,
    this.text = '',
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
    this.prefix,
    this.suffix,
    this.inputFormatters,
    this.obscuringCharacter = '•',
    this.onTextChange,
    this.onSubmitted,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.prefixMode = OverlayVisibilityMode.always,
    this.suffixMode = OverlayVisibilityMode.always,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CommonInputState();
  }
}

class CommonInputState extends BaseState<CommonInput> {
  TextEditingController _controller = TextEditingController();
  bool _obscureText = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode == null ? FocusNode() : widget.focusNode!;
    _obscureText = widget.obscureText;
    _controller.addListener(_onTextChange);
    setText(widget.text);
  }

  void _onTextChange() {
    widget.onTextChange?.call(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    var defaultTextSize = TodoLib.of(context).textSize;
    var defaultPlaceholderColor = TodoLib.of(context).placeholderColor;
    var defaultInputTextColor = TodoLib.of(context).inputTextColor;
    return CupertinoTextField(
      controller: _controller,
      focusNode: _focusNode,
      padding: widget.padding ?? symmetric(10, 0),
      placeholder: widget.placeholder,
      decoration: widget.decoration ??
          BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFEEEEEE),
                width: setWidth(1),
              ),
            ),
          ),
      style: TextStyle(
        color: widget.color ?? defaultInputTextColor,

        ///解决输入框提示与内容显示不一致问题
        height: 1.2,
        fontSize: setFontSize(widget.fontSize ?? defaultTextSize),
      ),
      placeholderStyle: TextStyle(
        color: widget.placeholderColor ?? defaultPlaceholderColor,
        fontSize: setFontSize(widget.placeholderFontSize ?? defaultTextSize),
      ),
      cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
      textAlign: widget.textAlign,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      obscureText: _obscureText,
      obscuringCharacter: widget.obscuringCharacter,
      onSubmitted: widget.onSubmitted,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      prefix: widget.prefix,
      suffix: widget.suffix,
      prefixMode: widget.prefixMode,
      suffixMode: widget.suffixMode,
    );
  }

  ///清空输入框内容
  void clearText() {
    _controller.text = '';
  }

  ///设置内容
  void setText(String text) {
    _controller.text = text;
  }

  void changeObscureText(bool obscureText) {
    this._obscureText = obscureText;
    setState(() {});
  }

  bool get obscureText => _obscureText;

  String getText() {
    return _controller.text;
  }

  void unFocus() {
    _focusNode.unfocus();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_onTextChange);
    _controller.dispose();
  }
}
