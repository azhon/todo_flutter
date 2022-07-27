/// createTime: 2021/10/15 on 14:15
/// desc: 请求接口基础类
///
/// @author azhon

class BaseBean<T> {
  static const DEFAULT_CODE = -1;

  int code = DEFAULT_CODE;
  T? data;
  String? message;

  BaseBean({required this.code, this.data, this.message});

  @override
  String toString() {
    return 'BaseBean{code: $code, data: $data, message: $message}';
  }
}

abstract class BaseResultBean {
  ///json数据转实体
  fromJson(dynamic json);
}

abstract class BaseListResultBean<T> extends BaseResultBean {
  List<T>? data;
  int? curPage;
  int? total;
  int? totalPage;
}
