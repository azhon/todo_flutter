/// createTime:  2021/10/15 on 14:31
/// desc:
///
/// @author   azhon

import 'dart:io';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';
import 'package:todo_flutter/generated/json/base/json_convert_content.dart';

class ApiConvert extends BaseConvert {
  @override
  BaseEntity<T> convert<T>(Result result) {
    if (result.statusCode == HttpStatus.ok) {
      final data = result.data?['data'];

      ///分页数据
      if (data is Map && data.containsKey('datas')) {
        return BaseEntity(
          code: result.data?['errorCode'],
          message: result.data?['errorMsg'],
          curPage: data['curPage'],
          total: data['total'],
          totalPage: data['pageCount'],
          data: JsonConvert.fromJsonAsT(data['datas']),
        );
      } else {
        return BaseEntity(
          code: result.data?['errorCode'],
          message: result.data?['errorMsg'],
          data: JsonConvert.fromJsonAsT(data),
        );
      }
    } else {
      ///网络请求 code != HttpStatus.ok
      return BaseEntity(
        code: result.statusCode ?? BaseEntity.defaultCode,
        message: result.statusMessage,
      );
    }
  }
}
