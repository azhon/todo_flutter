/// createTime: 2021/9/22 on 17:26
/// desc:
///
/// @author azhon

import 'dart:io' as io;
import 'dart:typed_data';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

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
    return widget ?? const Center(child: Text('Failed to load image'));
  }

  Widget? loadStateChanged(ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        break;
      case LoadState.failed:
        return const Center(child: Text('Failed to load image'));
      case LoadState.completed:
        return null;
    }
    return null;
  }
}
