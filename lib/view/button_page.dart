/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    button_page
 * 创建时间:  2021/9/17 on 18:14
 * 描述:     TODO
 *
 * @author   阿钟
 */
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/base/base_stateful_widget.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:flutter_basic_lib/ui/common_button.dart';

class ButtonPage extends BaseStatefulWidget {
  ButtonPage({Key? key}) : super(key: key);

  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends BaseState<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('按钮示例')),
      body: SingleChildScrollView(
        child: Padding(
          padding: all(32),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonButton(
                    '圆形\n按钮',
                    width: 120,
                    height: 120,
                    color: Colors.blue,
                    radius: 100,
                    fontSize: 26,
                    onPressed: () {},
                    onLongPress: () {},
                  ),
                  CommonButton(
                    '圆角按钮',
                    color: Colors.blue,
                    radius: 20,
                    width: 200,
                    margin: only(left: 20, top: 20),
                  ),
                  CommonButton(
                    '小按钮',
                    color: Colors.blue,
                    radius: 10,
                    width: 100,
                    height: 60,
                    fontSize: 20,
                    margin: only(left: 20, top: 20),
                  ),
                ],
              ),
              CommonButton(
                '不可点击按钮',
                color: Colors.grey,
                textColor: Colors.white,
                disable: true,
                margin: only(top: 20),
              ),
              CommonButton(
                '普通按钮',
                margin: only(top: 20),
              ),
              CommonButton(
                '圆角按钮',
                color: Colors.blue,
                radius: 20,
                margin: only(top: 20),
              ),
              CommonButton(
                '两边正圆角按钮',
                color: Colors.blue,
                radius: 100,
                margin: only(top: 20),
              ),
              CommonButton(
                '镂空不可点击按钮',
                disable: true,
                color: Colors.transparent,
                borderColor: Colors.red,
                textColor: Colors.red,
                margin: only(top: 20),
              ),
              CommonButton(
                '镂空按钮',
                color: Colors.transparent,
                borderColor: Colors.red,
                textColor: Colors.red,
                margin: only(top: 20),
              ),
              CommonButton(
                '镂空圆角按钮',
                color: Colors.transparent,
                borderColor: Colors.red,
                textColor: Colors.red,
                radius: 20,
                margin: only(top: 20),
              ),
              CommonButton(
                '镂空两边正圆角按钮',
                color: Colors.transparent,
                borderColor: Colors.red,
                textColor: Colors.red,
                radius: 100,
                margin: only(top: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
