/// createTime: 2021/10/22 on 11:02
/// desc: 网络请求异常
///
/// @author azhon

import 'package:flutter_basic_lib/src/net/bean/base_result_bean.dart';

class ApiException implements Exception {
  final BaseBean error;

  ApiException(this.error);

  @override
  String toString() {
    return 'ApiException: ${error.toString()}';
  }
}
