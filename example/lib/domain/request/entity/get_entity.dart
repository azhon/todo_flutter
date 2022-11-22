import 'package:todo_flutter/generated/json/base/json_field.dart';
import 'package:todo_flutter/generated/json/get_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class GetEntity {
  String? desc;
  int? id;
  String? imagePath;
  int? isVisible;
  int? order;
  String? title;
  int? type;
  String? url;

  GetEntity();

  factory GetEntity.fromJson(Map<String, dynamic> json) =>
      $GetEntityFromJson(json);

  Map<String, dynamic> toJson() => $GetEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
