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
    return formatTime(timestamp, format: 'yyyy');
  }

  static String month(int timestamp) {
    return formatTime(timestamp, format: 'MM');
  }

  static String day(int timestamp) {
    return formatTime(timestamp, format: 'dd');
  }

  static String yyyyMMdd(int timestamp) {
    return formatTime(timestamp, format: 'yyyy-MM-dd');
  }

  static String hour(int timestamp) {
    return formatTime(timestamp, format: 'HH');
  }

  static String minutes(int timestamp) {
    return formatTime(timestamp, format: 'mm');
  }

  static String seconds(int timestamp) {
    return formatTime(timestamp, format: 'ss');
  }

  static String hhmmss(int timestamp) {
    return formatTime(timestamp, format: 'HH:mm:ss');
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
