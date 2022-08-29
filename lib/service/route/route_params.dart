/// createTime: 2021/9/17 on 17:55
/// desc:
///
/// @author azhon

class RouteParams {
  static const String flagString = '0x7A';
  static const String flagInt = '0x7B';
  static const String flagDouble = '0x7C';
  static const String flagBool = '0x7D';

  final Map<String, dynamic> _data = {};

  ///存储字符串
  void withString(String key, String? value) {
    _data[key] = value;
  }

  ///存储int double
  void withNum(String key, num? value) {
    _data[key] = value;
  }

  ///存储布尔值
  void withBool(String key, bool? value) {
    _data[key] = value;
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
    if (_data.isEmpty) {
      return '';
    }
    String params = '?';
    _data.forEach((key, value) {
      params += '$key=${paramsType(value)}&';
    });
    return params.substring(0, params.length - 1);
  }

  ///参数类型标记
  String paramsType(value) {
    String flag = '';
    if (value is String) {
      flag = flagString;
    } else if (value is int) {
      flag = flagInt;
    } else if (value is double) {
      flag = flagDouble;
    } else if (value is bool) {
      flag = flagBool;
    }
    if (value is String) {
      ///中文需要uri编码
      return '$flag${Uri.encodeComponent(value)}';
    } else {
      return '$flag$value';
    }
  }
}
