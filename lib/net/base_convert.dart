/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    base_convert
 * 创建时间:  2021/10/15 on 14:22
 * 描述:      数据转换器
 *
 * @author   阿钟
 */
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

abstract class BaseConvert {
  ///[json]转成对应实体类
  BaseBean<T> convert<T>(Result result, BaseResultBean? resultBean);
}
