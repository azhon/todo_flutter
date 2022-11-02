import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

/// createTime: 2022/9/2 on 15:30
/// desc:
///
/// @author azhon
class UnFocusWidget extends BaseStatelessWidget {
  final Widget child;

  UnFocusWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonClickWidget(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
