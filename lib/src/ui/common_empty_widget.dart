import 'package:flutter/material.dart';
import 'package:todo_flutter/generated/assets/todo_flutter_assets.dart';
import 'package:todo_flutter/src/base/base_stateless_widget.dart';
import 'package:todo_flutter/src/ui/common_image.dart';
import 'package:todo_flutter/src/ui/common_text.dart';
import 'package:todo_flutter/todo_lib.dart';

/// createTime: 2023/4/23 on 11:13
/// desc:
///
/// @author azhon
class CommonEmptyWidget extends BaseStatelessWidget {
  const CommonEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: only(top: 112),
      child: Column(
        children: [
          const CommonImage(
            asset: TodoFlutterAssets.icEmpty,
            size: 86,
          ),
          Padding(
            padding: only(top: 4),
            child: CommonText(
              TodoLib.delegate(context).empty,
              fontSize: 12,
              color: const Color(0xFF161619),
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
