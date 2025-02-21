import 'package:todo_flutter/src/net/entity/base_entity.dart';

abstract class ListState<T> {
  List<T> data;
  BaseEntity? entity;

  ListState(this.data, this.entity);
}

class InitialState<T> extends ListState<T> {
  InitialState(List<T> data, BaseEntity? entity) : super(data, entity);
}
