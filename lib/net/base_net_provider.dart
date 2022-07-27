/// createTime: 2021/10/14 on 14:47
/// desc:
///
/// @author azhon

import 'package:flutter_basic_lib/net/base_convert.dart';
import 'package:flutter_basic_lib/net/base_net_engine.dart';

abstract class BaseNetProvider {
  ///创建网络请求客户端
  BaseNetEngine getEngine();

  ///网络数据转换器
  BaseConvert getConvert();
}
