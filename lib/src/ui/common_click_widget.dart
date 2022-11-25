/// createTime: 2021/9/17 on 21:12
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/base_state.dart';
import 'package:todo_flutter/src/base/base_stateful_widget.dart';
import 'package:todo_flutter/todo_lib.dart';

class CommonClickWidget extends BaseStatefulWidget {
  final Widget child;
  final GestureTapCallback? singleClick;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;

  CommonClickWidget({
    required this.child,
    Key? key,
    this.onTap,
    this.onLongPress,
    this.singleClick,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CommonClickState();
  }
}

class _CommonClickState extends BaseState<CommonClickWidget> {
  int _lastClick = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: widget.child,
      onLongPress: () => widget.onLongPress?.call(),
      onTap: () => _interceptClick(TodoLib.of(context).clickInterceptInterval),
    );
  }

  ///重复多次点击截流处理
  void _interceptClick(int clickInterceptInterval) {
    final int nowTime = DateTime.now().millisecondsSinceEpoch;
    if ((nowTime - _lastClick).abs() > clickInterceptInterval) {
      if (widget.singleClick != null) {
        widget.singleClick!.call();
      } else {
        widget.onTap?.call();
      }
      _lastClick = nowTime;
    } else {
      widget.onTap?.call();
    }
  }
}
