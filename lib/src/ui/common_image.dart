/// createTime: 2021/9/22 on 17:26
/// desc:
///
/// @author azhon

import 'dart:io' as io;
import 'dart:typed_data';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_flutter/generated/assets/todo_flutter_assets.dart';
import 'package:todo_flutter/src/base/base_stateless_widget.dart';
import 'package:todo_flutter/src/ui/widget/circular_progress_widget.dart';

typedef BuildStateWidget = Widget Function(
  LoadState state,
  double? width,
  double? height,
);

class CommonImage extends BaseStatelessWidget {
  final String? network;
  final String? asset;
  final Uint8List? memory;
  final io.File? file;
  final BoxFit fit;
  final double? width;
  final double? height;
  final double? size;
  final BorderRadius? borderRadius;
  final Color? color;
  final BoxBorder? border;
  final bool circle;
  final BuildStateWidget? loading;
  final BuildStateWidget? error;

  const CommonImage({
    this.network,
    this.asset,
    this.memory,
    this.file,
    Key? key,
    this.width,
    this.height,
    this.size,
    this.color,
    this.borderRadius,
    this.border,
    this.fit = BoxFit.cover,
    this.circle = false,
    this.loading,
    this.error,
  }) : super(key: key);

  double? get _getWidth => size ?? width;

  double? get _getHeight => size ?? height;

  @override
  Widget build(BuildContext context) {
    Widget? widget;
    final double? w = _getWidth == null ? null : setWidth(_getWidth!);
    final double? h = _getHeight == null ? null : setWidth(_getHeight!);
    final BoxShape shape = circle ? BoxShape.circle : BoxShape.rectangle;
    if (network != null) {
      widget = ExtendedImage.network(
        network!,
        width: w,
        height: h,
        shape: shape,
        fit: fit,
        color: color,
        border: border,
        borderRadius: borderRadius,
        gaplessPlayback: true,
        loadStateChanged: loadStateChanged,
      );
    }
    if (asset != null) {
      widget = ExtendedImage.asset(
        asset!,
        width: w,
        height: h,
        shape: shape,
        fit: fit,
        color: color,
        border: border,
        borderRadius: borderRadius,
        gaplessPlayback: true,
        loadStateChanged: loadStateChanged,
      );
    }
    if (memory != null) {
      widget = ExtendedImage.memory(
        memory!,
        width: w,
        height: h,
        shape: shape,
        fit: fit,
        color: color,
        border: border,
        borderRadius: borderRadius,
        gaplessPlayback: true,
        loadStateChanged: loadStateChanged,
      );
    }
    if (file != null) {
      widget = ExtendedImage.file(
        file!,
        width: w,
        height: h,
        shape: shape,
        fit: fit,
        color: color,
        border: border,
        borderRadius: borderRadius,
        gaplessPlayback: true,
        loadStateChanged: loadStateChanged,
      );
    }
    return widget ?? _defaultError();
  }

  Widget? loadStateChanged(ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        return _defaultLoading();
      case LoadState.failed:
        return _defaultError();
      case LoadState.completed:
        return null;
    }
  }

  Widget _defaultLoading() {
    if (loading != null) {
      return loading!.call(LoadState.loading, _getWidth, _getHeight);
    }
    return Container(
      width: _getWidth == null ? null : setWidth(_getWidth!),
      height: _getHeight == null ? null : setWidth(_getHeight!),
      alignment: Alignment.center,
      child: const CircularProgressWidget(),
    );
  }

  Widget _defaultError() {
    if (error != null) {
      return error!.call(LoadState.failed, _getWidth, _getHeight);
    }
    return Container(
      width: _getWidth == null ? null : setWidth(_getWidth!),
      height: _getHeight == null ? null : setWidth(_getHeight!),
      alignment: Alignment.center,
      child: const CommonImage(
        asset: TodoFlutterAssets.icImageError,
      ),
    );
  }
}
