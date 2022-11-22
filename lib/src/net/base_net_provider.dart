/// createTime: 2021/10/14 on 14:47
/// desc:
///
/// @author azhon

import 'package:todo_flutter/src/net/base_convert.dart';
import 'package:todo_flutter/src/net/base_net_engine.dart';

abstract class BaseNetProvider {
  ///创建网络请求客户端
  BaseNetEngine getEngine();

  ///网络数据转换器
  BaseConvert getConvert();
}
