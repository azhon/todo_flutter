/// createTime: 2021/10/22 on 11:18
/// desc:
///
/// @author azhon

class RuntimeException implements Exception {
  final dynamic message;

  RuntimeException([this.message]);

  String toString() {
    Object? message = this.message;
    if (message == null) return "RuntimeException";
    return "RuntimeException: $message";
  }
}
