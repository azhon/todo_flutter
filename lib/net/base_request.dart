/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    base_request
 * 创建时间:  2021/10/15 on 10:56
 * 描述:     定义请求
 *
 * @author   阿钟
 */
import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:flutter_basic_lib/net/base_net_engine.dart';
import 'package:flutter_basic_lib/net/base_net_provider.dart';
import 'package:flutter_basic_lib/util/log_util.dart';

enum RequestMethod {
  GET,
  POST,
  POST_JSON,
  DEL,
  PUT,
}

abstract class BaseRequest<T extends BaseResultBean> {
  String get url;

  RequestMethod get method;

  Map<String, dynamic>? get params;

  ///返回数据模型示例
  BaseResultBean? get resultInstance;

  BaseNetProvider getNetProvider();

  ///请求数据
  Future<BaseBean<T>> request() async {
    BaseNetEngine engine = getNetProvider().getEngine();
    BaseConvert convert = getNetProvider().getConvert();
    Result result = Result(null, null, null);
    try {
      switch (method) {
        case RequestMethod.GET:
          result = await engine.get(url, params: params);
          break;
        case RequestMethod.POST:
          result = await engine.post(url, params: params);
          break;
        case RequestMethod.POST_JSON:
          result = await engine.postJson(url, params: params);
          break;
        case RequestMethod.DEL:
          result = await engine.del(url, params: params);
          break;
        case RequestMethod.PUT:
          result = await engine.put(url, params: params);
          break;
      }
    } catch (e) {
      result.statusMessage = _parseError(e);
      LogUtil.d('BaseRequest：[request error] ${result.statusMessage}');
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
