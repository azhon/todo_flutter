/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    base_net_engine
 * 创建时间:  2021/10/14 on 11:48
 * 描述:
 *
 * @author   阿钟
 */
class Result {
  dynamic data;
  int? statusCode;
  String? statusMessage;

  Result(this.data, this.statusCode, this.statusMessage);
}

abstract class BaseNetEngine {
  final String baseUrl;

  BaseNetEngine(this.baseUrl);

  Future<Result> get(String url, {Map<String, dynamic>? params});

  Future<Result> post(String url, {Map<String, dynamic>? params});

  Future<Result> postJson(String url, {Map<String, dynamic>? params});

  Future<Result> del(String url, {Map<String, dynamic>? params});

  Future<Result> put(String url, {Map<String, dynamic>? params});

  ///设置连接超时时间
  ///[timeout]超时时间ms
  setConnectTimeout(int timeout);

  ///设置接收超时时间
  ///[timeout]超时时间ms
  setReceiveTimeout(int timeout);

  ///设置dio代理
  ///[ip]代理ip地址
  ///[port]代理端口
  setProxy(String ip, String port);
}
