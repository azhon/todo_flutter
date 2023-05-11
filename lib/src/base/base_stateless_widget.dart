/// createTime: 2021/9/17 on 17:45
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/ui_adapter.dart';
import 'package:todo_flutter/src/base/ui_widget.dart';

abstract class BaseStatelessWidget extends StatelessWidget
    with UIAdapter, UIWidget {
  const BaseStatelessWidget({Key? key}) : super(key: key);
}
