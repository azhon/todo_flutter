/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    api_exception
 * 创建时间:  2021/10/22 on 11:02
 * 描述:     网络请求异常
 *
 * @author   阿钟
 */
import 'package:flutter_basic_lib/net/bean/base_result_bean.dart';

class ApiException implements Exception {
  final BaseBean error;

  ApiException(this.error);

  String toString() {
    return "ApiException: ${error.toString()}";
  }
}
