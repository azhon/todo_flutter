import 'dart:async';

import 'package:flutter/material.dart';

/// createTime: 2023/12/1 on 16:56
/// desc: app global events
///
/// @author azhon

typedef GlobalEventCallBack = Function(String type, String? data);

class GlobalEventManager {
  factory GlobalEventManager() => _getInstance();

  GlobalEventManager._internal();

  static GlobalEventManager get instance => _getInstance();
  static GlobalEventManager? _instance;

  // ignore: close_sinks
  final _stateController = StreamController<GlobalEvent>.broadcast();

  static GlobalEventManager _getInstance() {
    _instance ??= GlobalEventManager._internal();
    return _instance!;
  }

  ///
  StreamSubscription subscribe(ValueChanged<GlobalEvent> listener) {
    return _stateController.stream.listen(listener);
  }

  ///notify all listener
  void notifyAll(String type, [String? data]) {
    _stateController.sink.add(GlobalEvent(type, data));
  }
}

class GlobalEvent {
  final String type;
  final String? data;

  GlobalEvent(this.type, [this.data]);
}
