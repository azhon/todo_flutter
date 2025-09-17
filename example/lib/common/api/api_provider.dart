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

  DioEngine dioEngine = DioEngine('http://www.wanandroid.com/');
  ApiConvert apiConvert = ApiConvert();

  ApiProvider._internal() {
    // dioEngine.setProxy('192.168.110.7', 8888);
    dioEngine.addInterceptor(TestInterceptor());
    dioEngine.addInterceptor(CaptureDioInterceptor());
  }

  @override
  BaseNetEngine get engine => dioEngine;

  @override
  BaseConvert get convert => apiConvert;
}

class TestInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['test-header'] = 'flutter';
    handler.next(options);
  }
}

abstract class ApiRequest<T> extends BaseRequest<T> {
  ApiRequest(Object? params) : super(params);

  @override
  String get pageKey => 'page';

  @override
  String get pageSizeKey => 'page_size';

  @override
  BaseNetProvider get netProvider => ApiProvider.instance;
}
