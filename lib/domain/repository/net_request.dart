/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    net_request
 * 创建时间:  2021/10/15 on 13:40
 * 描述:     
 *
 * @author   阿钟
 */

import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:flutter_basic_lib/net/base_request.dart';
import 'package:todo_flutter/common/api/api_provider.dart';
import 'package:todo_flutter/domain/bean/get_bean.dart';

class NetGetRequest extends ApiRequest<GetBean> {
  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get url => 'banner/json';

  @override
  Map<String, dynamic>? get params => {'id': '323', 'name': 'azhon'};

  @override
  BaseResultBean get resultInstance => GetBean();
}

class NetPostRequest extends ApiRequest {
  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  String get url => 'lg/uncollect_originId/2333/json';

  @override
  Map<String, dynamic>? get params => {'id': '323', 'name': 'azhon'};

  @override
  BaseResultBean? get resultInstance => null;
}
