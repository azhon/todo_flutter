/// createTime: 2021/9/18 on 14:50
/// desc:
///
/// @author azhon
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

class TextPage extends BaseStatefulWidget {
  TextPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextPageState();
}

class _TextPageState extends BaseState<TextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('文本示例')),
      body: SingleChildScrollView(
        child: Padding(
          padding: all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText('我是文本呀'),
              sizedBox(height: 10),
              CommonText(
                '我是蓝色文本呀',
                color: Colors.blue,
                fontSize: 15,
              ),
              sizedBox(height: 10),
              CommonText(
                '我是单行文本呀' * 10,
                color: Colors.pink,
                maxLines: 1,
                fontSize: 16,
              ),
              sizedBox(height: 10),
              CommonText(
                '我是有下划线文本呀',
                color: Colors.cyanAccent,
                fontSize: 17,
                decoration: TextDecoration.underline,
              ),
              sizedBox(height: 10),
              CommonText(
                '我是有删除线文本呀',
                color: Colors.redAccent,
                fontSize: 18,
                decoration: TextDecoration.lineThrough,
              ),
              sizedBox(height: 10),
              CommonText(
                '我是W700文本呀',
                color: Colors.blueGrey,
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
              sizedBox(height: 10),
              CommonText(
                '我是斜体文本呀',
                color: Colors.blueGrey,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
              sizedBox(height: 10),
              CommonText(
                '我是虚线下划线文本呀',
                color: Colors.purple,
                fontSize: 21,
                decorationStyle: TextDecorationStyle.dashed,
                decoration: TextDecoration.underline,
              ),
              sizedBox(height: 10),
              CommonText(
                '我是有2倍字间距文本呀' * 2,
                color: Colors.indigo,
                fontSize: 22,
                letterSpacing: 2,
              ),
              sizedBox(height: 10),
              CommonText(
                '我是最大三行文本呀' * 20,
                color: Colors.green,
                maxLines: 3,
                fontSize: 23,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
