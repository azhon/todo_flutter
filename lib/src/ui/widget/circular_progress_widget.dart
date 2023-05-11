import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/base_stateless_widget.dart';

/// createTime: 2023/4/28 on 16:36
/// desc:
///
/// @author azhon
class CircularProgressWidget extends BaseStatelessWidget {
  const CircularProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: CircularProgressIndicator(
        color: const Color(0xFF161619),
        strokeWidth: setWidth(2),
      ),
    );
  }
}
