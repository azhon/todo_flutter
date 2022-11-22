/// createTime: 2021/10/22 on 11:02
/// desc: 网络请求异常
///
/// @author azhon

import 'package:todo_flutter/src/net/entity/base_entity.dart';

class ApiException implements Exception {
  final BaseEntity entity;

  ApiException(this.entity);

  @override
  String toString() {
    return 'ApiException: ${entity.toString()}';
  }
}
