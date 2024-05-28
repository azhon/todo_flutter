/// createTime: 2021/10/15 on 14:15
/// desc: 请求接口基础类
///
/// @author azhon

class BaseEntity<T> {
  static const defaultCode = -1;

  T? data;
  int code = defaultCode;
  String? message;
  String? traceId;

  ///分页接口
  int? curPage;
  int? total;
  int? totalPage;

  BaseEntity({
    required this.code,
    this.data,
    this.message,
    this.curPage,
    this.total,
    this.totalPage,
    this.traceId,
  });

  @override
  String toString() {
    return '''
BaseEntity {
  code: $code,
  message: $message,
  traceId: $traceId,
  data: $data,
  data: $data,
  curPage: $curPage,
  total: $total,
}
''';
  }
}
