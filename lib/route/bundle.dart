/// createTime: 2022/6/27 on 21:04
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/route/route_params.dart';
import 'package:flutter_basic_lib/route/router_util.dart';

class Bundle extends RouteParams {
  final String route;

  Bundle(this.route);

  Bundle withString(String key, String? value) {
    super.withString(key, value);
    return this;
  }

  Bundle withNum(String key, num? value) {
    super.withNum(key, value);
    return this;
  }

  Bundle withBool(String key, bool? value) {
    super.withBool(key, value);
    return this;
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

  Future navigateResult(ValueChanged<RouteParams> result) {
    return RouterUtil.instance.navigateResult(this, result);
  }
}
