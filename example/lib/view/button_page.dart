/// createTime: 2021/9/17 on 18:14
/// desc:
///
/// @author azhon
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

class ButtonPage extends BaseStatefulWidget {
  ButtonPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ButtonPageState();
}

class _ButtonPageState extends BaseState<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('按钮示例')),
      body: SingleChildScrollView(
        child: Padding(
          padding: all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonButton(
                    '圆形\n按钮',
                    width: 60,
                    height: 60,
                    color: Colors.blue,
                    radius: 100,
                    fontSize: 13,
                    onPressed: () {},
                    onLongPress: () {},
                  ),
                  CommonButton(
                    '圆角按钮',
                    color: Colors.blue,
                    radius: 20,
                    width: 100,
                    margin: only(left: 10, top: 10),
                  ),
                  CommonButton(
                    '小按钮',
                    radius: 10,
                    fontSize: 10,
                    padding: symmetric(4, 13),
                    color: Colors.blue,
                    margin: only(left: 10, top: 10),
                  ),
                ],
              ),
              CommonButton(
                '不可点击按钮',
                color: Colors.grey,
                disable: true,
                margin: only(top: 10),
              ),
              CommonButton(
                '普通按钮',
                margin: only(top: 10),
              ),
              CommonButton(
                '圆角按钮',
                color: Colors.blue,
                radius: 20,
                margin: only(top: 10),
              ),
              CommonButton(
                '两边正圆角按钮',
                color: Colors.blue,
                radius: 100,
                margin: only(top: 10),
              ),
              CommonButton(
                '渐变色按钮',
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.red],
                ),
                margin: only(top: 10),
              ),
              CommonButton(
                '镂空不可点击按钮',
                disable: true,
                color: Colors.transparent,
                borderColor: Colors.red,
                textColor: Colors.red,
                margin: only(top: 10),
              ),
              CommonButton(
                '镂空按钮',
                color: Colors.transparent,
                borderColor: Colors.red,
                textColor: Colors.red,
                margin: only(top: 10),
              ),
              CommonButton(
                '镂空圆角按钮',
                color: Colors.transparent,
                borderColor: Colors.red,
                textColor: Colors.red,
                radius: 10,
                margin: only(top: 10),
              ),
              CommonButton(
                '镂空两边正圆角按钮',
                color: Colors.transparent,
                borderColor: Colors.red,
                textColor: Colors.red,
                radius: 100,
                margin: only(top: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
