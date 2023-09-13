/// createTime: 2021/10/19 on 17:24
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/base_stateless_widget.dart';
import 'package:todo_flutter/src/ui/common_text.dart';
import 'package:todo_flutter/src/ui/dialog/loading_dialog.dart';

class LoadingDialogWidget extends BaseStatelessWidget {
  final String? msg;
  final bool canceledOutside;

  const LoadingDialogWidget({
    this.msg,
    this.canceledOutside = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (canceledOutside) {
          LoadingDialog.dismiss();
        }
      },
      child: Center(
        child: Container(
          width: setWidth(100),
          height: setWidth(100),
          decoration: BoxDecoration(
            color: const Color(0x99000000),
            borderRadius: BorderRadius.circular(setRadius(8)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              sizedBox(height: 20),
              const CircularProgressIndicator(color: Colors.white),
              sizedBox(height: 12),
              Padding(
                padding: symmetric(horizontal: 10),
                child: CommonText(
                  msg ?? 'Loading...',
                  color: Colors.white,
                  maxLines: 2,
                  fontSize: 12,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
