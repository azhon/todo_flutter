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

  static String year(int timestamp) {
    return formatTime(timestamp, 'yyyy');
  }

  static String month(int timestamp) {
    return formatTime(timestamp, 'MM');
  }

  static String day(int timestamp) {
    return formatTime(timestamp, 'dd');
  }

  static String yyyyMMdd(int timestamp) {
    return formatTime(timestamp, 'yyyy-MM-dd');
  }

  static String hour(int timestamp) {
    return formatTime(timestamp, 'HH');
  }

  static String minutes(int timestamp) {
    return formatTime(timestamp, 'mm');
  }

  static String seconds(int timestamp) {
    return formatTime(timestamp, 'ss');
  }

  static String hhmmss(int timestamp) {
    return formatTime(timestamp, 'HH:mm:ss');
  }

  ///格式化时间
  static String formatTime(
    int timestamp, [
    String format = 'yyyy-MM-dd HH:mm:ss',
  ]) {
    if (timestamp <= 0) {
      return '';
    }
    return DateFormat(format)
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp));
  }

  static int parseTimestamp(String? time) {
    return parseDate(time).millisecondsSinceEpoch;
  }

  ///解析时间
  static DateTime parseDate(String? time) {
    try {
      if (time == null || time.isEmpty) {
        throw Exception('time is empty.');
      }
      return DateTime.parse(time);
    } catch (e) {
      return DateTime.now();
    }
  }
}
