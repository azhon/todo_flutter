import 'package:todo_flutter_example/generated/json/base/json_field.dart';
import 'package:todo_flutter_example/generated/json/list_data_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ListDataEntity {

	bool? adminAdd;
	String? apkLink;
	int? audit;
	String? author;
	bool? canEdit;
	int? chapterId;
	String? chapterName;
	bool? collect;
	int? courseId;
	String? desc;
	String? descMd;
	String? envelopePic;
	bool? fresh;
	String? host;
	int? id;
	bool? isAdminAdd;
	String? link;
	String? niceDate;
	String? niceShareDate;
	String? origin;
	String? prefix;
	String? projectLink;
	int? publishTime;
	int? realSuperChapterId;
	int? selfVisible;
	int? shareDate;
	String? shareUser;
	int? superChapterId;
	String? superChapterName;
	List<dynamic>? tags;
	String? title;
	int? type;
	int? userId;
	int? visible;
	int? zan;
  
  ListDataEntity();

  factory ListDataEntity.fromJson(Map<String, dynamic> json) => $ListDataEntityFromJson(json);

  Map<String, dynamic> toJson() => $ListDataEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}