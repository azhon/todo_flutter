/// createTime: 2021/10/18 on 17:25
/// desc:
///
/// @author azhon

import 'package:logger/logger.dart';

class LogUtil {
  static final Logger _logger =
      Logger(printer: PrettyPrinter(printEmojis: false));

  static void v(message, [error, StackTrace? stackTrace]) {
    _logger.log(Level.verbose, message, error, stackTrace);
  }

  static void d(message, [error, StackTrace? stackTrace]) {
    _logger.log(Level.debug, message, error, stackTrace);
  }

  static void i(message, [error, StackTrace? stackTrace]) {
    _logger.log(Level.info, message, error, stackTrace);
  }

  static void w(message, [error, StackTrace? stackTrace]) {
    _logger.log(Level.warning, message, error, stackTrace);
  }

  static void e(message, [error, StackTrace? stackTrace]) {
    _logger.log(Level.error, message, error, stackTrace);
  }

  static void wtf(message, [error, StackTrace? stackTrace]) {
    _logger.log(Level.wtf, message, error, stackTrace);
  }
}
