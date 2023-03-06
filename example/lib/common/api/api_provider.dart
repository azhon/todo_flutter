/// createTime: 2021/10/15 on 10:29
/// desc: 单例对象，保证所有请求使用一份数据
///
/// @author azhon
import 'package:todo_flutter/todo_flutter.dart';
import 'package:todo_flutter_example/common/api/api_convert.dart';

class ApiProvider extends BaseNetProvider {
  factory ApiProvider() => _getInstance();

  static ApiProvider get instance => _getInstance();
  static ApiProvider? _instance;

  static ApiProvider _getInstance() {
    _instance ??= ApiProvider._internal();
    return _instance!;
  }

  DioEngine engine = DioEngine('https://www.wanandroid.com/');
  ApiConvert convert = ApiConvert();

  ApiProvider._internal() {
    // engine.setProxy('192.168.110.254', 8888);
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
}

abstract class ApiRequest<T> extends BaseRequest<T> {
  ApiRequest(Map<String, dynamic>? params) : super(params);

  @override
  BaseNetProvider getNetProvider() {
    return ApiProvider.instance;
  }
}
