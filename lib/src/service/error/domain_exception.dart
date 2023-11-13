/// createTime: 2021/10/22 on 11:02
/// desc: 网络请求异常
///
/// @author azhon

import 'package:todo_flutter/src/net/entity/base_entity.dart';

abstract class DomainException implements Exception {
  final String? message;

  DomainException(this.message);

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}

///网络错误异常
class NetworkException extends DomainException {
  NetworkException(BaseEntity entity) : super(entity.toString());
}

///服务器返回错误
class ApiException extends DomainException {
  ApiException(BaseEntity entity) : super(entity.toString());
}

///其他未知错误
class UnknownException extends DomainException {
  UnknownException(String? message) : super(message);
}
