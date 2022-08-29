/// createTime: 2021/10/14 on 13:59
/// desc:
///
/// @author azhon

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flutter_basic_lib/net/base_net_engine.dart';

class DioEngine extends BaseNetEngine {
  late Dio _dio;

  DioEngine(String baseUrl) : super(baseUrl) {
    _dio = Dio();
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5 * 1000,
      receiveTimeout: 5 * 1000,
    );
  }

  @override
  Future<Result> get(String url, {Map<String, dynamic>? params}) async {
    final Response response = await _dio.get(url, queryParameters: params);
    return Result(response.data, response.statusCode, response.statusMessage);
  }

  @override
  Future<Result> post(String url, {Map<String, dynamic>? params}) async {
    final Response response =
        await _dio.post(url, data: FormData.fromMap(params ?? {}));
    return Result(response.data, response.statusCode, response.statusMessage);
  }

  @override
  Future<Result> postJson(String url, {Map<String, dynamic>? params}) async {
    final Response response = await _dio.post(url, data: params);
    return Result(response.data, response.statusCode, response.statusMessage);
  }

  @override
  Future<Result> del(String url, {Map<String, dynamic>? params}) async {
    final Response response = await _dio.delete(url, data: params);
    return Result(response.data, response.statusCode, response.statusMessage);
  }

  @override
  Future<Result> put(String url, {Map<String, dynamic>? params}) async {
    final Response response = await _dio.put(url, data: params);
    return Result(response.data, response.statusCode, response.statusMessage);
  }

  ///设置连接超时时间
  ///[timeout]超时时间ms
  @override
  void setConnectTimeout(int timeout) {
    _dio.options.connectTimeout = timeout;
  }

  ///设置接收超时时间
  ///[timeout]超时时间ms
  @override
  void setReceiveTimeout(int timeout) {
    _dio.options.receiveTimeout = timeout;
  }

  ///设置dio代理
  ///[ip]代理ip地址
  ///[port]代理端口
  @override
  void setProxy(String ip, String port) {
    final DefaultHttpClientAdapter adapter = DefaultHttpClientAdapter()
      ..onHttpClientCreate = (HttpClient client) {
        client
          ..findProxy = (uri) {
            return 'PROXY $ip:$port';
          }
          ..badCertificateCallback = (cert, host, port) => true;
        return client;
      };
    _dio.httpClientAdapter = adapter;
  }

  ///添加拦截器
  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }
}
