/// createTime: 2021/9/17 on 17:45
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/src/base/ui_adapter.dart';
import 'package:flutter_basic_lib/src/base/ui_widget.dart';

abstract class BaseStatelessWidget extends StatelessWidget
    with UIAdapter, UIWidget {
  BaseStatelessWidget({Key? key}) : super(key: key);
}
