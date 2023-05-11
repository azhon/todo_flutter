/// createTime: 2021/9/17 on 21:12
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/base_state.dart';
import 'package:todo_flutter/src/base/base_stateful_widget.dart';
import 'package:todo_flutter/todo_lib.dart';

///点击事件拦截，返回false则中断点击
typedef ClickHandler = Future<bool> Function();

class CommonClickWidget extends BaseStatefulWidget {
  final Widget child;
  final ClickHandler? clickHandler;
  final GestureTapCallback? onTap;
  final GestureTapCallback? singleClick;
  final GestureLongPressCallback? onLongPress;

  const CommonClickWidget({
    required this.child,
    Key? key,
    this.onTap,
    this.onLongPress,
    this.singleClick,
    this.clickHandler,
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
      onLongPress: () => _checkHandler(2),
      onTap: () => _interceptClick(TodoLib.of(context).clickInterceptInterval),
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
    final pass = await widget.clickHandler?.call();
    if (false == pass) {
      return;
    }
    if (type == 0) {
      widget.singleClick!.call();
    } else if (type == 1) {
      widget.onTap?.call();
    } else if (type == 2) {
      widget.onLongPress?.call();
    }
  }
}
