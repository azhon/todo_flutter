/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    api_provider
 * 创建时间:  2021/10/15 on 10:29
 * 描述:      单例对象，保证所有请求使用一份数据
 *
 * @author   阿钟
 */
import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:flutter_basic_lib/net/base_convert.dart';
import 'package:flutter_basic_lib/net/base_net_engine.dart';
import 'package:flutter_basic_lib/net/base_net_provider.dart';
import 'package:flutter_basic_lib/net/dio_engine.dart';
import 'package:todo_flutter/common/api/api_convert.dart';

class ApiProvider extends BaseNetProvider {
  factory ApiProvider() => _getInstance();

  static ApiProvider get instance => _getInstance();
  static ApiProvider? _instance;

  static ApiProvider _getInstance() {
    if (_instance == null) {
      _instance = ApiProvider._internal();
    }
    return _instance!;
  }

  DioEngine engine = DioEngine('https://www.wanandroid.com/');
  ApiConvert convert = ApiConvert();

  ApiProvider._internal() {
    // engine.setProxy('192.168.110.159', '8888');
    engine.addInterceptor(TestInterceptor());
  }

  @override
  BaseNetEngine getEngine() {
    return engine;
  }

  @override
  BaseConvert getConvert() {
    return convert;
  }
}

class TestInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['test-header'] = 'flutter';
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}

abstract class ApiRequest<T extends BaseResultBean> extends BaseRequest<T> {
  @override
  BaseNetProvider getNetProvider() {
    return ApiProvider.instance;
  }
}
