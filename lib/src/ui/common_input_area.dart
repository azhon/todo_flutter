/// createTime: 2021/9/29 on 10:14
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/base_state.dart';
import 'package:todo_flutter/src/base/base_stateful_widget.dart';
import 'package:todo_flutter/src/bloc/data/data_change_bloc.dart';
import 'package:todo_flutter/src/ui/common_input.dart';
import 'package:todo_flutter/src/ui/common_text.dart';
import 'package:todo_flutter/src/ui/widget/data_change_widget.dart';
import 'package:todo_flutter/todo_lib.dart';

class CommonInputArea extends BaseStatefulWidget {
  final double? minHeight;
  final double? maxHeight;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? countPadding;
  final double? countFontSize;
  final Color? countTextColor;

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
  final TextEditingController? controller;
  final ValueChanged<String>? onTextChange;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onSubmitted;

  CommonInputArea({
    Key? key,
    this.minHeight,
    this.maxHeight,
    this.countPadding,
    this.backgroundColor,
    this.countFontSize,
    this.countTextColor,
    this.borderRadius,

    ///原本输入的属性
    this.controller,
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
    this.onSubmitted,
    this.focusNode,
    this.onTextChange,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CommonInputAreaState();
}

class _CommonInputAreaState extends BaseState<CommonInputArea> {
  DataChangeBloc<int> get _countBloc => getBloc<DataChangeBloc<int>>();

  @override
  void initState() {
    super.initState();
    addBloc(DataChangeBloc<int>(0));
  }

  @override
  Widget build(BuildContext context) {
    final Color defaultBackgroundColor =
        TodoLib.of(context).inputBackgroundColor;
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
            controller: widget.controller,
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
            decoration: const BoxDecoration(),
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
                child: (context, int? state) {
                  return CommonText(
                    '$state/${widget.maxLength}',
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
}
