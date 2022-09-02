import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

/// createTime: 2022/9/2 on 15:30
/// desc:
///
/// @author azhon
class UnFocusWidget extends BaseStatelessWidget {
  final Widget child;
  final List<FocusNode?>? nodes;

  UnFocusWidget({required this.child, this.nodes, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonClickWidget(
      onTap: () {
        nodes?.forEach((node) {
          node?.unfocus();
        });
      },
      child: child,
    );
  }
}
