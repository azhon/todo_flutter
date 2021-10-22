/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    base_net_provider
 * 创建时间:  2021/10/14 on 14:47
 * 描述:
 *
 * @author   阿钟
 */
import 'package:flutter_basic_lib/net/base_convert.dart';
import 'package:flutter_basic_lib/net/base_net_engine.dart';

abstract class BaseNetProvider {
  ///创建网络请求客户端
  BaseNetEngine getEngine();

  ///网络数据转换器
  BaseConvert getConvert();
}
