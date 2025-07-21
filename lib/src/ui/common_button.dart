/// createTime: 2021/9/17 on 17:44
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/base_state.dart';
import 'package:todo_flutter/todo_lib.dart';
import 'package:todo_flutter/src/ui/common_text.dart';

class CommonButton extends StatefulWidget {
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
  final VoidCallback? singleClick;
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
    this.singleClick,
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
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends BaseState<CommonButton> {
  double? get width => widget.width;

  double? get height => widget.height;

  EdgeInsets? get padding => widget.padding;

  EdgeInsets? get margin => widget.margin;

  int _lastClick = 0;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final double defaultButtonHeight = TodoLib.of(context).buttonHeight;
    final defaultFontFamily = TodoLib.of(context).fontFamily;
    final defaultFontFamilyFallback = TodoLib.of(context).fontFamilyFallback;

    return IgnorePointer(
      ignoring: widget.disable,
      child: Container(
        width: width == null ? null : setWidth(width!),
        height: height == null
            ? (padding == null ? setWidth(defaultButtonHeight) : null)
            : setWidth(height!),
        margin: margin,
        decoration: BoxDecoration(
          gradient: widget.gradient,
          borderRadius: BorderRadius.circular(setRadius(widget.radius)),
        ),
        child: TextButton(
          onPressed: () => _interceptClick(
            TodoLib.of(context).clickInterceptInterval,
          ),
          onLongPress: () => widget.onLongPress?.call(),
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor:
                widget.gradient == null ? (widget.color ?? primaryColor) : null,
            side: BorderSide(
              color: widget.borderColor,
              width: setWidth(widget.borderWidth),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(setRadius(widget.radius)),
            ),
            minimumSize: Size.zero,
            padding: padding ?? EdgeInsets.zero,
          ),
          child: CommonText(
            widget.text,
            color: widget.textColor,
            fontWeight: widget.fontWeight,
            fontSize: widget.fontSize,
            textAlign: widget.textAlign,
            overflow: widget.overflow,
            fontFamily: widget.fontFamily ?? defaultFontFamily,
            fontFamilyFallback:
                widget.fontFamilyFallback ?? defaultFontFamilyFallback,
          ),
        ),
      ),
    );
  }

  ///重复多次点击截流处理
  void _interceptClick(int clickInterceptInterval) {
    final int nowTime = DateTime.now().millisecondsSinceEpoch;
    if ((nowTime - _lastClick).abs() > clickInterceptInterval) {
      if (widget.singleClick != null) {
        _checkHandler(0);
      } else {
        _checkHandler(1);
      }
      _lastClick = nowTime;
    } else {
      _checkHandler(1);
    }
  }

  ///检测是否中断
  Future<void> _checkHandler(int type) async {
    if (type == 0) {
      widget.singleClick!.call();
    } else if (type == 1) {
      widget.onPressed?.call();
    }
  }
}
