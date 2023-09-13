import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/base_stateless_widget.dart';

/// createTime: 2022/9/6 on 16:53
/// desc: 去除安卓水波纹效果
///
/// @author azhon
class RemoveRippleWidget extends BaseStatelessWidget {
  final Widget child;

  const RemoveRippleWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(behavior: _RemoveRippleBehavior(), child: child);
  }
}

class _RemoveRippleBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    if (Platform.isAndroid) {
      return child;
    }
    return super.buildOverscrollIndicator(context, child, details);
  }
}
