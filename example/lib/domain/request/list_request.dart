/// createTime: 2022/07/27 on 10:14
/// desc:
///
/// @author azhon

import 'package:todo_flutter/todo_flutter.dart';
import 'package:todo_flutter_example/common/api/api_provider.dart';
import 'package:todo_flutter_example/domain/request/entity/list_data_entity.dart';

class ListRequest extends ApiRequest<List<ListDataEntity>> {
  ListRequest() : super(null);

  @override
  RequestMethod get method => RequestMethod.get;

  @override
  String get url => 'article/list/0/json';
}
