/// createTime: 2022/6/27 on 21:04
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/service/route/route_params.dart';
import 'package:flutter_basic_lib/service/route/router_util.dart';

class Bundle extends RouteParams {
  final String route;

  Bundle(this.route);

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
