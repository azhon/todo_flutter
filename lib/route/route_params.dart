/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    route_params
 * 创建时间:  2021/9/17 on 17:55
 * 描述:     TODO
 *
 * @author   阿钟
 */
class RouteParams {
  static const String FLAG_STRING = '0x7A';
  static const String FLAG_INT = '0x7B';
  static const String FLAG_DOUBLE = '0x7C';
  static const String FLAG_BOOL = '0x7D';

  dynamic _obj;
  final Map<String, dynamic> _data = {};

  ///存储字符串
  void putString(String key, String value) {
    _data[key] = value;
  }

  ///存储int double
  void putNum(String key, num value) {
    _data[key] = value;
  }

  ///存储布尔值
  void putBool(String key, bool value) {
    _data[key] = value;
  }

  ///存储对象
  void putObj(dynamic obj) {
    this._obj = obj;
  }

  String? getString(String key) {
    return _data[key];
  }

  num? getNum(String key) {
    return _data[key];
  }

  bool? getBool(String key) {
    return _data[key];
  }

  dynamic getObj() {
    return _obj;
  }

  String toUri() {
    if (_data.isEmpty) return '';
    String params = '?';
    _data.forEach((key, value) {
      params += '$key=${paramsType(value)}&';
    });
    return params.substring(0, params.length - 1);
  }

  ///参数类型标记
  String paramsType(dynamic value) {
    String flag = '';
    if (value is String) {
      flag = FLAG_STRING;
    } else if (value is int) {
      flag = FLAG_INT;
    } else if (value is double) {
      flag = FLAG_DOUBLE;
    } else if (value is bool) {
      flag = FLAG_BOOL;
    }
    if (value is String) {
      ///中文需要uri编码
      return '$flag${Uri.encodeComponent(value)}';
    } else {
      return '$flag$value';
    }
  }
}
