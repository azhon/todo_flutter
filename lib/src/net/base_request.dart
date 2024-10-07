/// createTime: 2021/10/15 on 10:56
/// desc:
///
/// @author azhon

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:todo_flutter/src/net/base_convert.dart';
import 'package:todo_flutter/src/net/base_net_engine.dart';
import 'package:todo_flutter/src/net/base_net_provider.dart';
import 'package:todo_flutter/src/net/entity/base_entity.dart';
import 'package:todo_flutter/src/util/log_util.dart';

enum RequestMethod {
  get,
  post,
  postJson,
  del,
  put,
}

mixin Paging {
  ///用于处理分页参数存在url path上，动态改变Url
  final String pagingUrlKey = 'pagingUrlKey';

  ///用于处理分页参数存在url path上
  final String page = '{page}';

  ///分页 页码字段值
  String get pageKey;

  ///分页 一页数量字段值
  String get pageSizeKey;
}

abstract class BaseRequest<T> with Paging {
  Map<String, dynamic>? params;

  BaseRequest(this.params);

  String get url;

  RequestMethod get method => RequestMethod.get;

  BaseNetProvider get netProvider;

  String get _realUrl {
    final temp = params?[pagingUrlKey] ?? url;
    params?.remove(pagingUrlKey);
    return temp;
  }

  ///请求数据
  Future<BaseEntity<T>> request() async {
    final BaseNetEngine engine = netProvider.engine;
    final BaseConvert convert = netProvider.convert;
    Result result = Result();
    final url = _realUrl;
    final logUrl = _printLog(engine);
    try {
      switch (method) {
        case RequestMethod.get:
          result = await engine.get(url, params: params);
          break;
        case RequestMethod.post:
          result = await engine.post(url, params: params);
          break;
        case RequestMethod.postJson:
          result = await engine.postJson(url, params: params);
          break;
        case RequestMethod.del:
          result = await engine.del(url, params: params);
          break;
        case RequestMethod.put:
          result = await engine.put(url, params: params);
          break;
      }
    } catch (e) {
      _parseError(result, e);
      LogUtil.d('BaseRequest：[request error] $logUrl\n${result.statusMessage}');
    }
    return convert.convert<T>(result);
  }

  String _printLog(BaseNetEngine engine) {
    String paramsStr = params.toString();
    try {
      paramsStr = jsonEncode(params);
    } catch (e) {
      ///ignore
    }
    final logUrl = 'url：${engine.baseUrl}$url\nparams：$paramsStr';
    LogUtil.d('BaseRequest：[request start]\n$logUrl\nmethod：$method');
    return logUrl;
  }

  ///获取异常信息
  void _parseError(Result result, e) {
    if (e is DioException) {
      if (e.response != null) {
        result.statusCode = e.response!.statusCode;
        result.statusMessage = e.response!.statusMessage;
      } else {
        result.statusMessage = e.message ?? '';
      }
    } else {
      result.statusMessage = e.toString();
    }
  }
}
