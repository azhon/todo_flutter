import 'package:intl/intl.dart';

/// createTime: 2023/4/14 on 19:34
/// desc:
///
/// @author azhon
class TimeUtil {
  ///获取当前时间
  static DateTime now() {
    return DateTime.now();
  }

  static String HHmmss(int timestamp) {
    return formatTime(timestamp, format: 'HH:mm:ss');
  }

  static String yyyyMMdd(int timestamp) {
    return formatTime(timestamp, format: 'yyyy-MM-dd');
  }

  ///格式化时间
  static String formatTime(
    int timestamp, {
    String format = 'yyyy-MM-dd HH:mm:ss',
  }) {
    if (timestamp <= 0) {
      return '';
    }
    return DateFormat(format)
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp));
  }
}
