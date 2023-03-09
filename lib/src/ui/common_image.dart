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

class CommonImage extends BaseStatelessWidget {
  final String? network;
  final String? asset;
  final Uint8List? memory;
  final io.File? file;
  final BoxFit fit;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? color;
  final BoxBorder? border;
  final bool circle;
  final Widget? loading;
  final Widget? error;

  CommonImage({
    this.network,
    this.asset,
    this.memory,
    this.file,
    Key? key,
    this.width,
    this.height,
    this.color,
    this.borderRadius,
    this.border,
    this.fit = BoxFit.cover,
    this.circle = false,
    this.loading,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? widget;
    final double? w = width == null ? null : setWidth(width!);
    final double? h = height == null ? null : setWidth(height!);
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
        loadStateChanged: loadStateChanged,
      );
    }
    return widget ?? _defaultError();
  }

  Widget? loadStateChanged(ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        return _defaultLoading(width, height);
      case LoadState.failed:
        return Container(
          width: width == null ? null : setWidth(width!),
          height: height == null ? null : setWidth(height!),
          alignment: Alignment.center,
          child: error ?? _defaultError(),
        );
      case LoadState.completed:
        return null;
    }
  }

  Widget _defaultLoading(double? width, double? height) {
    return Container(
      width: width == null ? null : setWidth(width),
      height: height == null ? null : setWidth(height),
      alignment: Alignment.center,
      child: loading ?? const CupertinoActivityIndicator(),
    );
  }

  Widget _defaultError() {
    return CommonImage(
      asset: TodoFlutterAssets.icImageError,
    );
  }
}
