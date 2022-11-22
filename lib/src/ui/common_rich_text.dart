import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/base_state.dart';
import 'package:todo_flutter/src/base/base_stateful_widget.dart';

class CommonRichText extends BaseStatefulWidget {
  final List<RichTextParams> params;
  final int maxLines;
  final TextOverflow? overflow;

  CommonRichText(
    this.params, {
    Key? key,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CommonRichTextState();
}

class _CommonRichTextState extends BaseState<CommonRichText> {
  List<TextSpan> _getItem() {
    final List<TextSpan> list = [];
    widget.params.forEach((element) {
      list.add(
        TextSpan(
          text: element.text,
          recognizer: TapGestureRecognizer()
            ..onTap = () => element.click?.call(),
          style: TextStyle(
            color: element.color,
            fontWeight: element.fontWeight,
            fontSize: setFontSize(element.size),
          ),
        ),
      );
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: _getItem(),
      ),
      maxLines: widget.maxLines,
      overflow: widget.overflow,
    );
  }
}

class RichTextParams {
  final String text;
  final Color color;
  final double size;
  final FontWeight? fontWeight;
  final VoidCallback? click;

  RichTextParams(
    this.text,
    this.size,
    this.color, {
    this.fontWeight,
    this.click,
  });
}
