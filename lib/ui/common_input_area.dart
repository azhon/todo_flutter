/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    common_input_area
 * 创建时间:  2021/9/29 on 10:14
 * 描述:     TODO
 *
 * @author   阿钟
 */
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/bloc/data/data_change_bloc.dart';
import 'package:flutter_basic_lib/bloc/data/data_change_state.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

class CommonInputArea extends BaseStatefulWidget {
  final Key? key;
  final double? minHeight;
  final double? maxHeight;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? countPadding;
  final double? countFontSize;
  final Color? countTextColor;

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
  final FocusNode? focusNode;
  final ValueChanged<String>? onTextChange;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onSubmitted;

  CommonInputArea({
    this.key,
    this.minHeight,
    this.maxHeight,
    this.countPadding,
    this.backgroundColor,
    this.countFontSize,
    this.countTextColor,
    this.borderRadius,

    ///原本输入的属性
    this.text = '',
    this.padding,
    this.placeholder = '请输入描述信息',
    this.placeholderFontSize,
    this.placeholderColor,
    this.fontSize,
    this.color,
    this.decoration,
    this.maxLength,
    this.maxLines,
    this.autofocus = false,
    this.onTextChange,
    this.onSubmitted,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  _CommonInputAreaState createState() => _CommonInputAreaState();
}

class _CommonInputAreaState extends BaseState<CommonInputArea> {
  DataChangeBloc<int> get _countBloc => getBloc<DataChangeBloc<int>>();
  GlobalKey<CommonInputState> _inputKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    addBloc(DataChangeBloc(data: 0));
  }

  @override
  Widget build(BuildContext context) {
    Color defaultBackgroundColor = TodoLib.of(context).inputBackgroundColor;
    return Container(
      constraints: BoxConstraints(
        minHeight: widget.minHeight ?? 0,
        maxHeight: widget.maxHeight ?? double.infinity,
      ),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? defaultBackgroundColor,
        borderRadius:
            widget.borderRadius ?? BorderRadius.circular(setRadius(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CommonInput(
            key: _inputKey,
            text: widget.text,
            padding: widget.padding ?? all(12),
            placeholder: widget.placeholder,
            placeholderColor: widget.placeholderColor,
            placeholderFontSize: widget.placeholderFontSize,
            fontSize: widget.fontSize,
            color: widget.color,
            maxLength: widget.maxLength,
            maxLines: widget.maxLines,
            autofocus: widget.autofocus,
            onSubmitted: widget.onSubmitted,
            focusNode: widget.focusNode,
            textInputAction: widget.textInputAction,
            keyboardType: widget.keyboardType,
            decoration: BoxDecoration(),
            onTextChange: (text) {
              widget.onTextChange?.call(text);
              _countBloc.changeData(text.length);
            },
          ),
          Visibility(
            visible: widget.maxLength != null,
            child: Padding(
              padding: widget.countPadding ?? only(right: 24, bottom: 24),
              child: DataChangeWidget<int>(
                bloc: _countBloc,
                child: (context, DataChangeState<int> state) {
                  return CommonText(
                    '${state.data}/${widget.maxLength}',
                    color: widget.countTextColor,
                    fontSize: widget.countFontSize,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  ///清空输入框内容
  void clearText() {
    _inputKey.currentState?.clearText();
  }

  ///设置内容
  void setText(String text) {
    _inputKey.currentState?.setText(text);
  }

  String getText() {
    return _inputKey.currentState?.getText() ?? '';
  }

  void unFocus() {
    _inputKey.currentState?.unFocus();
  }
}
