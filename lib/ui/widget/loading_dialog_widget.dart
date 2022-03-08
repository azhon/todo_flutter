/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    loading_dialog
 * 创建时间:  2021/10/19 on 17:24
 * 描述:     
 *
 * @author   阿钟
 */
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

class LoadingDialog extends Dialog with UIAdapter, UIWidget {
  final String? msg;

  LoadingDialog({this.msg}) : super(insetPadding: EdgeInsets.zero);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      constrainedAxis: Axis.vertical,
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            width: setWidth(100),
            height: setWidth(100),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0x4D000000),
                borderRadius: BorderRadius.circular(setRadius(8))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(color: Colors.white),
                sizedBox(height: 10),
                CommonText(msg ?? 'Loading...', color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
