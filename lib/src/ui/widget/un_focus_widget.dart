import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/base_stateless_widget.dart';
import 'package:todo_flutter/src/ui/common_click_widget.dart';

/// createTime: 2022/9/2 on 15:30
/// desc:
///
/// @author azhon
class UnFocusWidget extends BaseStatelessWidget {
  final Widget child;

  const UnFocusWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonClickWidget(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
