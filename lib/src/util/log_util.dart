/// createTime: 2021/10/18 on 17:25
/// desc:
///
/// @author azhon

import 'package:logger/logger.dart';

class LogUtil {
  static final Logger _logger =
      Logger(printer: PrettyPrinter(printEmojis: false));

  static void v(message, {Object? error, StackTrace? stackTrace}) {
    _logger.log(Level.trace, message, error: error, stackTrace: stackTrace);
  }

  static void d(message, {Object? error, StackTrace? stackTrace}) {
    _logger.log(Level.debug, message, error: error, stackTrace: stackTrace);
  }

  static void i(message, {Object? error, StackTrace? stackTrace}) {
    _logger.log(Level.info, message, error: error, stackTrace: stackTrace);
  }

  static void w(message, {Object? error, StackTrace? stackTrace}) {
    _logger.log(Level.warning, message, error: error, stackTrace: stackTrace);
  }

  static void e(message, {Object? error, StackTrace? stackTrace}) {
    _logger.log(Level.error, message, error: error, stackTrace: stackTrace);
  }

  static void wtf(message, {Object? error, StackTrace? stackTrace}) {
    _logger.log(Level.fatal, message, error: error, stackTrace: stackTrace);
  }
}
