import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

/// createTime: 2022/9/6 on 16:53
/// desc: 去除安卓水波纹效果
///
/// @author azhon
class RemoveRippleWidget extends BaseStatelessWidget {
  final Widget child;

  RemoveRippleWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(behavior: _RemoveRippleBehavior(), child: child);
  }
}

class _RemoveRippleBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    final platform = getPlatform(context);
    if (platform == TargetPlatform.android ||
        platform == TargetPlatform.fuchsia) {
      return GlowingOverscrollIndicator(
        showLeading: false,
        showTrailing: false,
        axisDirection: axisDirection,
        color: Theme.of(context).colorScheme.secondary,
      );
    }
    return child;
  }
}
