/// createTime: 2021/10/15 on 10:56
/// desc:
///
/// @author azhon

import 'package:dio/dio.dart';
import 'package:flutter_basic_lib/src/net/base_convert.dart';
import 'package:flutter_basic_lib/src/net/base_net_engine.dart';
import 'package:flutter_basic_lib/src/net/base_net_provider.dart';
import 'package:flutter_basic_lib/src/net/bean/base_result_bean.dart';
import 'package:flutter_basic_lib/src/util/log_util.dart';

enum RequestMethod {
  get,
  post,
  postJson,
  del,
  put,
}

abstract class BaseRequest<T> {
  Map<String, dynamic>? params;

  BaseRequest(this.params);

  String get url;

  RequestMethod get method;

  ///返回数据模型示例
  BaseResultBean? get resultInstance;

  BaseNetProvider getNetProvider();

  ///请求数据
  Future<BaseBean<T>> request() async {
    final BaseNetEngine engine = getNetProvider().getEngine();
    final BaseConvert convert = getNetProvider().getConvert();
    Result result = Result(null, null, null);
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
      result.statusMessage = _parseError(e);
      LogUtil.e('BaseRequest：[request error] ${result.statusMessage}');
    }
    return convert.convert<T>(result, resultInstance);
  }

  ///获取异常信息
  String _parseError(e) {
    if (e is DioError) {
      return e.message;
    }
    return e.toString();
  }
}
