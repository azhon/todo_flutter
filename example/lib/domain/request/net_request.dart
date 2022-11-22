/// createTime: 2021/10/15 on 13:40
/// desc:
///
/// @author azhon

import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:todo_flutter/common/api/api_provider.dart';
import 'package:todo_flutter/domain/request/entity/get_entity.dart';

class NetGetRequest extends ApiRequest<List<GetEntity>> {
  NetGetRequest() : super({'id': '323', 'name': 'azhon'});

  @override
  RequestMethod get method => RequestMethod.get;

  @override
  String get url => 'banner/json';
}

class NetPostRequest extends ApiRequest {
  NetPostRequest() : super({'id': '323', 'name': 'azhon'});

  @override
  RequestMethod get method => RequestMethod.post;

  @override
  String get url => 'lg/uncollect_originId/2333/json';
}
