/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    image_page
 * 创建时间:  2021/9/22 on 17:19
 * 描述:     TODO
 *
 * @author   阿钟
 */
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/base/base_state.dart';
import 'package:flutter_basic_lib/base/base_stateful_widget.dart';
import 'package:flutter_basic_lib/ui/common_image.dart';
import 'package:todo_flutter/util/image_path.dart';

class ImagePage extends BaseStatefulWidget {
  ImagePage({Key? key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends BaseState<ImagePage> {
  final String imgUrl = 'https://avatar.csdnimg.cn/F/8/2/1_a_zhon.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('图片示例')),
      body: SingleChildScrollView(
        child: Padding(
          padding: all(32),
          child: Wrap(
            direction: Axis.horizontal,
            runSpacing: setWidth(20),
            spacing: setWidth(20),
            children: [
              CommonImage(
                network: imgUrl,
                width: 160,
                height: 160,
              ),
              CommonImage(
                network: imgUrl,
                borderRadius: BorderRadius.circular(setRadius(40)),
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
                  width: setWidth(4),
                ),
              ),

              ///本地图片
              CommonImage(
                asset: ImagePath.ic_police,
                width: 400,
                height: 400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
