/// createTime: 2021/10/19 on 17:24
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:todo_flutter/src/base/base_state.dart';
import 'package:todo_flutter/src/base/ui_adapter.dart';
import 'package:todo_flutter/src/base/ui_widget.dart';
import 'package:todo_flutter/src/ui/common_text.dart';
import 'package:todo_flutter/src/base/base_stateful_widget.dart';
import 'package:todo_flutter/src/ui/dialog/loading_dialog.dart';

class LoadingDialogWidget extends BaseStatefulWidget {
  final LoadingDialogController? controller;

  LoadingDialogWidget({Key? key, this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoadingDialogWidgetState();
  }
}

class LoadingDialogWidgetState extends BaseState<LoadingDialogWidget>
    with UIAdapter, UIWidget {
  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(_updateMsg);
  }

  void _updateMsg() {
    setState(() {});
  }

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
                  padding: symmetric(0, 10),
                  child: CommonText(
                    widget.controller?.msg ?? 'Loading...',
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller?.removeListener(_updateMsg);
  }
}
