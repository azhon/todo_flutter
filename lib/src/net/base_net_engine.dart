/// createTime: 2021/10/14 on 11:48
/// desc:
///
/// @author azhon

class Result {
  Map? data;
  int? statusCode;
  String? statusMessage;

  Result(this.data, this.statusCode, this.statusMessage);
}

abstract class BaseNetEngine {
  final String baseUrl;

  BaseNetEngine(this.baseUrl)
      : assert(baseUrl.endsWith('/'), 'baseUrl must be end with /');

  Future<Result> get(String url, {Map<String, dynamic>? params});

  Future<Result> post(String url, {Map<String, dynamic>? params});

  Future<Result> postJson(String url, {Map<String, dynamic>? params});

  Future<Result> del(String url, {Map<String, dynamic>? params});

  Future<Result> put(String url, {Map<String, dynamic>? params});

  ///设置连接超时时间
  ///[timeout]超时时间ms
  void setConnectTimeout(int timeout);

  ///设置接收超时时间
  ///[timeout]超时时间ms
  void setReceiveTimeout(int timeout);

  ///设置dio代理
  ///[ip]代理ip地址
  ///[port]代理端口
  void setProxy(String ip, String port);
}