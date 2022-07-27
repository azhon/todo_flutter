/// createTime: 2021/9/17 on 18:53
/// desc:
///
/// @author azhon
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin UIAdapter {
  /// 屏幕 宽
  double get screenWidth => ScreenUtil().screenWidth;

  /// 屏幕 高
  double get screenHeight => ScreenUtil().screenHeight;

  ///状态栏高度
  double get statusBarHeight => ScreenUtil().statusBarHeight;

  double setFontSize(double size) {
    return size.sp;
  }

  double setWidth(double width) {
    return width.w;
  }

  double setRadius(double radius) {
    return radius.w;
  }
}
