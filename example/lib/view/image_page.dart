/// createTime: 2021/9/22 on 17:19
/// desc:
///
/// @author azhon
import 'package:flutter/material.dart';
import 'package:todo_flutter/todo_flutter.dart';
import 'package:todo_flutter_example/generated/assets/example_assets.dart';
import 'package:todo_flutter_example/generated/assets/example_icon.dart';

class ImagePage extends BaseStatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImagePageState();
}

class _ImagePageState extends BaseState<ImagePage> {
  final String imgUrl = 'https://avatar.csdnimg.cn/F/8/2/1_a_zhon.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('图片示例')),
      body: SingleChildScrollView(
        child: Padding(
          padding: all(16),
          child: Wrap(
            runSpacing: setWidth(10),
            spacing: setWidth(10),
            children: [
              Icon(
                ExampleIcon.menu,
                size: setWidth(48),
              ),
              CommonImage(
                network: imgUrl,
                width: 80,
                height: 80,
              ),
              CommonImage(
                network: imgUrl,
                borderRadius: BorderRadius.circular(setRadius(20)),
              ),
              CommonImage(
                network: imgUrl,
                circle: true,
              ),
              CommonImage(
                network: imgUrl,
                circle: true,
                border: Border.all(
                  color: Colors.pink,
                  width: setWidth(2),
                ),
              ),

              ///本地图片
              const CommonImage(
                asset: ExampleAssets.icPolice,
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
