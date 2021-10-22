/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    common_image
 * 创建时间:  2021/9/22 on 17:26
 * 描述:     TODO
 *
 * @author   阿钟
 */
import 'dart:typed_data';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/base/ui_adapter.dart';
import 'package:flutter_basic_lib/base/base_stateless_widget.dart';

class CommonImage extends BaseStatelessWidget with UIAdapter {
  final String? network;
  final String? asset;
  final Uint8List? memory;
  final File? file;
  final BoxFit fit;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? color;
  final BoxBorder? border;
  final bool circle;

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
  }) : super(key: key) {
    ///资源来源必须有一个
    assert(
        (network != null || asset != null || memory != null || file != null));
  }

  @override
  Widget build(BuildContext context) {
    late Widget widget;
    double? w = width == null ? null : setWidth(width!);
    double? h = height == null ? null : setWidth(height!);
    BoxShape shape = circle ? BoxShape.circle : BoxShape.rectangle;
    if (network != null)
      widget = ExtendedImage.network(network!,
          width: w,
          height: h,
          shape: shape,
          fit: fit,
          color: color,
          border: border,
          borderRadius: borderRadius,
          loadStateChanged: (state) => loadStateChanged(state));
    if (asset != null)
      widget = ExtendedImage.asset(asset!,
          width: w,
          height: h,
          shape: shape,
          fit: fit,
          color: color,
          border: border,
          borderRadius: borderRadius,
          loadStateChanged: (state) => loadStateChanged(state));
    if (memory != null)
      widget = ExtendedImage.memory(memory!,
          width: w,
          height: h,
          shape: shape,
          fit: fit,
          color: color,
          border: border,
          borderRadius: borderRadius,
          loadStateChanged: (state) => loadStateChanged(state));
    if (file != null)
      widget = ExtendedImage.file(file!,
          width: w,
          height: h,
          shape: shape,
          fit: fit,
          color: color,
          border: border,
          borderRadius: borderRadius,
          loadStateChanged: (state) => loadStateChanged(state));
    return widget;
  }

  Widget? loadStateChanged(ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        break;
      case LoadState.failed:
        break;
      default:
        return null;
    }
  }
}
