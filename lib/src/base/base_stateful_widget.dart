/// createTime: 2021/9/17 on 21:22
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/src/base/ui_adapter.dart';

abstract class BaseStatefulWidget extends StatefulWidget with UIAdapter {
  BaseStatefulWidget({Key? key}) : super(key: key);
}
