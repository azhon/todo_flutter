/// createTime: 2021/10/14 on 13:59
/// desc:
///
/// @author azhon

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:todo_flutter/src/net/base_net_engine.dart';

class DioEngine extends BaseNetEngine {
  late Dio _dio;

  DioEngine(String baseUrl) : super(baseUrl) {
    _dio = Dio();
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    );
  }

  @override
  Future<Result> get(String url, {Map<String, dynamic>? params}) async {
    final Response response = await _dio.get<Map>(url, queryParameters: params);
    return Result(response.data, response.statusCode, response.statusMessage);
  }

  @override
  Future<Result> post(String url, {Map<String, dynamic>? params}) async {
    final Response response =
        await _dio.post<Map>(url, data: FormData.fromMap(params ?? {}));
    return Result(response.data, response.statusCode, response.statusMessage);
  }

  @override
  Future<Result> postJson(String url, {Map<String, dynamic>? params}) async {
    final Response response = await _dio.post<Map>(url, data: params);
    return Result(response.data, response.statusCode, response.statusMessage);
  }

  @override
  Future<Result> del(String url, {Map<String, dynamic>? params}) async {
    final Response response = await _dio.delete<Map>(url, data: params);
    return Result(response.data, response.statusCode, response.statusMessage);
  }

  @override
  Future<Result> put(String url, {Map<String, dynamic>? params}) async {
    final Response response = await _dio.put<Map>(url, data: params);
    return Result(response.data, response.statusCode, response.statusMessage);
  }

  ///设置连接超时时间
  ///[timeout]超时时间ms
  @override
  void setConnectTimeout(Duration timeout) {
    _dio.options.connectTimeout = timeout;
  }

  ///设置接收超时时间
  ///[timeout]超时时间ms
  @override
  void setReceiveTimeout(Duration timeout) {
    _dio.options.receiveTimeout = timeout;
  }

  ///设置dio代理
  ///[ip]代理ip地址
  ///[port]代理端口
  @override
  void setProxy(String ip, int port) {
    _dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.findProxy = (uri) {
          return 'PROXY $ip:$port';
        };
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      },
    );
  }

  ///添加拦截器
  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }
}
