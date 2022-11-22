import 'package:todo_flutter/generated/json/base/json_convert_content.dart';
import 'package:todo_flutter/domain/request/entity/get_entity.dart';

GetEntity $GetEntityFromJson(Map<String, dynamic> json) {
	final GetEntity getEntity = GetEntity();
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		getEntity.desc = desc;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		getEntity.id = id;
	}
	final String? imagePath = jsonConvert.convert<String>(json['imagePath']);
	if (imagePath != null) {
		getEntity.imagePath = imagePath;
	}
	final int? isVisible = jsonConvert.convert<int>(json['isVisible']);
	if (isVisible != null) {
		getEntity.isVisible = isVisible;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		getEntity.order = order;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		getEntity.title = title;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		getEntity.type = type;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		getEntity.url = url;
	}
	return getEntity;
}

Map<String, dynamic> $GetEntityToJson(GetEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['desc'] = entity.desc;
	data['id'] = entity.id;
	data['imagePath'] = entity.imagePath;
	data['isVisible'] = entity.isVisible;
	data['order'] = entity.order;
	data['title'] = entity.title;
	data['type'] = entity.type;
	data['url'] = entity.url;
	return data;
}