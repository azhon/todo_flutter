/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    runtime_exception
 * 创建时间:  2021/10/22 on 11:18
 * 描述:     
 *
 * @author   阿钟
 */
class RuntimeException implements Exception {
  final dynamic message;

  RuntimeException([this.message]);

  String toString() {
    Object? message = this.message;
    if (message == null) return "RuntimeException";
    return "RuntimeException: $message";
  }
}
