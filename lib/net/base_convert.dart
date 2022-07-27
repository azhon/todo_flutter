/// createTime: 2021/10/15 on 14:22
/// desc: 数据转换器
///
/// @author azhon

import 'package:flutter_basic_lib/flutter_basic_lib.dart';

abstract class BaseConvert {
  ///[json]转成对应实体类
  BaseBean<T> convert<T>(Result result, BaseResultBean? resultBean);
}
