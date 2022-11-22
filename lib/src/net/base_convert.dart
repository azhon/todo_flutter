/// createTime: 2021/10/15 on 14:22
/// desc: 数据转换器
///
/// @author azhon

import 'package:todo_flutter/src/net/base_net_engine.dart';
import 'package:todo_flutter/src/net/entity/base_entity.dart';

abstract class BaseConvert {
  ///[result]中的data json 数据转成对应实体类
  BaseEntity<T> convert<T>(Result result);
}
