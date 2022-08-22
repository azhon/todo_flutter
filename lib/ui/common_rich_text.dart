import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

class CommonRichText extends BaseStatefulWidget {
  final List<RichTextParams> params;

  CommonRichText(this.params, {Key? key}) : super(key: key);

  @override
  _CommonRichTextState createState() => _CommonRichTextState();
}

class _CommonRichTextState extends BaseState<CommonRichText> {
  List<TextSpan> _getItem() {
    List<TextSpan> list = [];
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
    );
  }
}

class RichTextParams {
  final String text;
  final Color color;
  final double size;
  final FontWeight? fontWeight;
  final VoidCallback? click;

  RichTextParams(this.text, this.size, this.color,
      {this.fontWeight, this.click});
}
