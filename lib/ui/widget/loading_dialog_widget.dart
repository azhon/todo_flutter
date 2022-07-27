/// createTime: 2021/10/19 on 17:24
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

class LoadingDialogWidget extends Dialog with UIAdapter, UIWidget {
  final String? msg;

  LoadingDialogWidget({this.msg}) : super(insetPadding: EdgeInsets.zero);

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
