/// createTime: 2021/10/22 on 11:18
/// desc:
///
/// @author azhon

class RuntimeException implements Exception {
  final dynamic message;

  RuntimeException([this.message]);

  @override
  String toString() {
    return 'RuntimeException: $message';
  }
}
