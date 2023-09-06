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
  final String imgUrl =
      'https://profile-avatar.csdnimg.cn/8bd82632b9c24ebba970cd1d6581d35f_a_zhon.jpg!1';

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
                size: 150,
              ),
              CommonImage(
                network: imgUrl,
                circle: true,
                size: 150,
                border: Border.all(
                  color: Colors.pink,
                  width: setWidth(2),
                ),
              ),

              ///本地图片
              const CommonImage(
                asset: ExampleAssets.icPolice,
                width: 150,
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
