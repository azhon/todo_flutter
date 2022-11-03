// ignore_for_file: avoid_returning_this
/// createTime: 2022/6/27 on 21:04
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/src/service/route/router_util.dart';
import 'package:flutter_basic_lib/src/service/route/routes.dart';

class Bundle {
  final String route;
  final Map<String, dynamic> _data = {};

  Bundle([this.route = '']);

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

  Future navigate() {
    return RouterUtil.instance.navigate(this);
  }

  Future navigateReplace() {
    return RouterUtil.instance.navigateReplace(this);
  }

  Future navigateClear() {
    return RouterUtil.instance.navigateClear(this);
  }

  Future navigatePopUntil(String untilRoute) {
    return RouterUtil.instance.navigatePopUntil(this, untilRoute);
  }

  Future navigateResult(ValueChanged<Bundle> result) {
    return RouterUtil.instance.navigateResult(this, result);
  }
}
