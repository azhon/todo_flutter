/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    base_stateful_widget
 * 创建时间:  2021/9/17 on 21:22
 * 描述:     TODO
 *
 * @author   阿钟
 */
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/base/ui_adapter.dart';

abstract class BaseStatefulWidget extends StatefulWidget with UIAdapter {
  BaseStatefulWidget({Key? key}) : super(key: key);
}
