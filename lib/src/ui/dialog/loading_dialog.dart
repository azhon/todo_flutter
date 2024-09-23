import 'package:flutter/material.dart';
import 'package:todo_flutter/src/ui/widget/loading_dialog_widget.dart';
import 'package:todo_flutter/todo_flutter.dart';

/// createTime: 2023/4/4 on 20:14
/// desc:
///
/// @author azhon
///

class LoadingDialogInit extends BaseStatefulWidget {
  final Widget child;

  const LoadingDialogInit({required this.child, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialogInit> {
  late OverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    _overlayEntry = OverlayEntry(
      builder: (_) =>
          LoadingDialog.instance.currWidget ?? const SizedBox.shrink(),
    );
    LoadingDialog.instance.overlayEntry = _overlayEntry;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      LoadingDialog.instance.customLoading = TodoLib.of(context).loadingWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(
        child: Overlay(
          initialEntries: [
            OverlayEntry(builder: (_) => widget.child),
            _overlayEntry,
          ],
        ),
      ),
    );
  }
}

class LoadingDialog {
  factory LoadingDialog() => instance;
  static final LoadingDialog instance = LoadingDialog._internal();
  OverlayEntry? overlayEntry;
  Widget? currWidget;
  Widget? customLoading;

  LoadingDialog._internal();

  ///显示对话框
  static void show({String? msg}) {
    instance._show(msg: msg);
  }

  ///隐藏对话框
  static void dismiss() {
    instance._dismiss();
  }

  ///是否在显示
  static bool isShow() {
    return instance.currWidget == null;
  }

  void _show({String? msg}) {
    currWidget = customLoading ?? LoadingDialogWidget(msg: msg);
    overlayEntry?.markNeedsBuild();
  }

  void _dismiss() {
    if (currWidget == null) {
      return;
    }
    currWidget = null;
    overlayEntry?.markNeedsBuild();
  }
}
