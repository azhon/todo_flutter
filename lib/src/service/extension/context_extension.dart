import 'package:flutter/cupertino.dart';

/// createTime: 2024/11/18 on 11:22
/// desc:
///
/// @author azhon
extension BuildContextEx on BuildContext {
  ///
  double get top => MediaQuery.of(this).padding.top;

  ///
  double get bottom => MediaQuery.of(this).padding.bottom;

  ///
  Size get screenSize => MediaQuery.of(this).size;

  double safeBottom([double pb = 0]) {
    return bottom > 0 ? bottom : pb;
  }
}
