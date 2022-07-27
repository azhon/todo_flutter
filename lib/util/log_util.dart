/// createTime: 2021/10/18 on 17:25
/// desc:
///
/// @author azhon

import 'package:logger/logger.dart';

class LogUtil {
  static Logger _logger =
      Logger(printer: PrettyPrinter(methodCount: 2, printEmojis: false));

  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.log(Level.verbose, message, error, stackTrace);
  }

  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.log(Level.debug, message, error, stackTrace);
  }

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.log(Level.info, message, error, stackTrace);
  }

  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.log(Level.warning, message, error, stackTrace);
  }

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.log(Level.error, message, error, stackTrace);
  }

  static void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.log(Level.wtf, message, error, stackTrace);
  }
}
