import 'package:flutter/material.dart';
import 'package:todo_flutter/generated/assets/todo_flutter_assets.dart';
import 'package:todo_flutter/todo_flutter.dart';

/// createTime: 2023/4/23 on 11:13
/// desc:
///
/// @author azhon
class CommonErrorWidget extends BaseStatelessWidget {
  final VoidCallback? onPressed;

  const CommonErrorWidget({this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: only(top: 112),
      child: Column(
        children: [
          const CommonImage(
            asset: TodoFlutterAssets.icError,
            size: 86,
          ),
          CommonButton(
            TodoLib.delegate(context).pleaseTryAgain,
            fontSize: 12,
            textColor: const Color(0xFF161619),
            fontWeight: FontWeight.w300,
            borderColor: const Color(0xFF161619),
            color: Colors.white,
            padding: symmetric(vertical: 8, horizontal: 12),
            margin: only(top: 33),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
