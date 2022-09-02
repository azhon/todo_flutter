class ObjectUtil {
  ///对象是不为空
  ///[obj] 任意对象
  static bool isNotEmpty(Object? obj) {
    return !isEmpty(obj);
  }

  ///对象是否为空
  ///[obj] 任意对象
  static bool isEmpty(Object? obj) {
    if (obj == null) {
      return true;
    }
    if (obj is String) {
      return obj.isEmpty;
    }
    if (obj is List) {
      return obj.isEmpty;
    }
    if (obj is Map) {
      return obj.isEmpty;
    }
    return false;
  }
}
