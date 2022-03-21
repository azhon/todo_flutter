/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    base_stateless_widget
 * 创建时间:  2021/9/17 on 17:45
 * 描述:
 *
 * @author   阿钟
 */
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/base/ui_adapter.dart';
import 'package:flutter_basic_lib/base/ui_widget.dart';

abstract class BaseStatelessWidget extends StatelessWidget
    with UIAdapter, UIWidget {
  BaseStatelessWidget({Key? key}) : super(key: key);
}
