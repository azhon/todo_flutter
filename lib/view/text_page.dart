/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    text_page
 * 创建时间:  2021/9/18 on 14:50
 * 描述:     TODO
 *
 * @author   阿钟
 */
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/base/base_state.dart';
import 'package:flutter_basic_lib/base/base_stateful_widget.dart';
import 'package:flutter_basic_lib/ui/common_text.dart';

class TextPage extends BaseStatefulWidget {
  TextPage({Key? key}) : super(key: key);

  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends BaseState<TextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('文本示例')),
      body: SingleChildScrollView(
        child: Padding(
          padding: all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText('我是文本呀'),
              sizedBox(height: 10),
              CommonText(
                '我是蓝色文本呀',
                color: Colors.blue,
                fontSize: 30,
              ),
              sizedBox(height: 10),
              CommonText(
                '我是单行文本呀' * 10,
                color: Colors.pink,
                maxLines: 1,
                fontSize: 32,
              ),
              sizedBox(height: 10),
              CommonText(
                '我是有下划线文本呀',
                color: Colors.cyanAccent,
                fontSize: 34,
                decoration: TextDecoration.underline,
              ),
              sizedBox(height: 10),
              CommonText(
                '我是有删除线文本呀',
                color: Colors.redAccent,
                fontSize: 36,
                decoration: TextDecoration.lineThrough,
              ),
              sizedBox(height: 10),
              CommonText(
                '我是W700文本呀',
                color: Colors.blueGrey,
                fontSize: 38,
                fontWeight: FontWeight.w700,
              ),
              sizedBox(height: 10),
              CommonText(
                '我是斜体文本呀',
                color: Colors.blueGrey,
                fontSize: 40,
                fontStyle: FontStyle.italic,
              ),
              sizedBox(height: 10),
              CommonText(
                '我是虚线下划线文本呀',
                color: Colors.purple,
                fontSize: 42,
                decorationStyle: TextDecorationStyle.dashed,
                decoration: TextDecoration.underline,
              ),
              sizedBox(height: 10),
              CommonText(
                '我是有2倍字间距文本呀' * 2,
                color: Colors.indigo,
                fontSize: 44,
                letterSpacing: 2,
              ),
              sizedBox(height: 10),
              CommonText(
                '我是最大三行文本呀' * 20,
                color: Colors.green,
                maxLines: 3,
                fontSize: 46,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
