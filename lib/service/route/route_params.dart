/// createTime: 2021/9/17 on 17:55
/// desc:
///
/// @author azhon

class RouteParams {
  static const String FLAG_STRING = '0x7A';
  static const String FLAG_INT = '0x7B';
  static const String FLAG_DOUBLE = '0x7C';
  static const String FLAG_BOOL = '0x7D';

  final Map<String, dynamic> _data = {};

  ///存储字符串
  RouteParams withString(String key, String? value) {
    _data[key] = value;
    return this;
  }

  ///存储int double
  RouteParams withNum(String key, num? value) {
    _data[key] = value;
    return this;
  }

  ///存储布尔值
  RouteParams withBool(String key, bool? value) {
    _data[key] = value;
    return this;
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
