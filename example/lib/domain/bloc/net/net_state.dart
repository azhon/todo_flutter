/// createTime: 2021/10/15 on 11:55
/// desc:
///
/// @author azhon

import 'package:todo_flutter/domain/request/entity/get_entity.dart';

abstract class NetState {
  final List<GetEntity>? data;

  NetState(this.data);
}

class NetInitialState extends NetState {
  NetInitialState(List<GetEntity>? data) : super(data);
}
