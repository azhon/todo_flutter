import 'package:flutter/material.dart';

/// createTime: 2021/10/19 on 17:15
/// desc:
///
/// @author azhon

mixin LoadingState {
  ///获取[BuildContext]
  BuildContext get buildContext;

  ///view层接受bloc层事件
  ///[type]事件类型
  ///[data]事件携带数据
  void sendEventToView(String type, [data]);
}
