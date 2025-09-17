// ignore_for_file: avoid_returning_this
/// createTime: 2022/6/27 on 21:04
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:todo_flutter/src/service/route/router_util.dart';
import 'package:todo_flutter/src/service/route/routes.dart';

class Bundle {
  final String route;
  final Map<String, dynamic> _data = {};

  Bundle([this.route = '']);

  ///便捷存储
  Bundle withAll(String key, value) {
    if (value is String) {
      withString(key, value);
    }
    if (value is num) {
      withNum(key, value);
    }
    if (value is bool) {
      withBool(key, value);
    }
    return this;
  }

  ///存储字符串
  Bundle withString(String key, String? value) {
    _data[key] = value;
    return this;
  }

  ///存储int double
  Bundle withNum(String key, num? value) {
    _data[key] = value;
    return this;
  }

  ///存储布尔值
  Bundle withBool(String key, bool? value) {
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

  ///对象[_data]内容拷贝
  Bundle copyWith(Bundle? bundle) {
    ///清除旧数据
    _data.clear();
    if (bundle == null) {
      return this;
    }
    bundle._data.forEach((key, value) {
      _data[key] = value;
    });
    return this;
  }

  String toUri() {
    if (_data.isEmpty) {
      return '';
    }
    String params = '?';
    _data.forEach((key, value) {
      params += '$key=${_paramsType(value)}&';
    });
    return params.substring(0, params.length - 1);
  }

  ///参数类型标记
  String _paramsType(value) {
    if (value == null) {
      return RouteKeyFlag.flagNull;
    }
    String flag = '';
    if (value is String) {
      flag = RouteKeyFlag.flagString;
    } else if (value is int) {
      flag = RouteKeyFlag.flagInt;
    } else if (value is double) {
      flag = RouteKeyFlag.flagDouble;
    } else if (value is bool) {
      flag = RouteKeyFlag.flagBool;
    }
    if (value is String) {
      ///中文需要uri编码
      return '$flag${Uri.encodeComponent(value)}';
    } else {
      return '$flag$value';
    }
  }

  Future<T?> navigate<T>() {
    return RouterUtil.instance.navigate<T>(this);
  }

  Future<T?> navigateReplace<T>() {
    return RouterUtil.instance.navigateReplace<T>(this);
  }

  Future<T?> navigateClear<T>() {
    return RouterUtil.instance.navigateClear<T>(this);
  }

  Future<T?> navigatePopUntil<T>(String untilRoute) {
    return RouterUtil.instance.navigatePopUntil<T>(untilRoute, this);
  }

  Future navigateResult(ValueChanged<Bundle> result) {
    return RouterUtil.instance.navigateResult(result, this);
  }

  void popUntil(String untilRoute) {
    return RouterUtil.instance.popUntil(untilRoute);
  }

  void pop() {
    return RouterUtil.instance.pop(this);
  }

  @override
  String toString() {
    return toUri();
  }
}
