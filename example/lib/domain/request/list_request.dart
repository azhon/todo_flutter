/// createTime: 2022/07/27 on 10:14
/// desc:
///
/// @author azhon

import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:todo_flutter/common/api/api_provider.dart';
import 'package:todo_flutter/domain/request/entity/list_data_entity.dart';

class ListRequest extends ApiRequest<List<ListDataEntity>> {
  ListRequest() : super(null);

  @override
  RequestMethod get method => RequestMethod.get;

  @override
  String get url => 'article/list/0/json';
}
