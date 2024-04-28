import 'package:decimal/decimal.dart';

/// createTime: 2024/4/28 on 14:33
/// desc:
///
/// @author azhon
class CalculateUtil {
  ///加法
  static String plus(double a, double b) {
    final result = Decimal.parse(a.toString()) + Decimal.parse(b.toString());
    return result.toStringAsFixed(2);
  }

  ///减法
  static String minus(double a, double b) {
    final result = Decimal.parse(a.toString()) - Decimal.parse(b.toString());
    return result.toStringAsFixed(2);
  }

  ///乘法
  static String multiply(double a, double b) {
    final result = Decimal.parse(a.toString()) * Decimal.parse(b.toString());
    return result.toStringAsFixed(2);
  }

  ///除法
  static String divide(double a, double b) {
    final result = Decimal.parse(a.toString()) / Decimal.parse(b.toString());
    return result.toDouble().toStringAsFixed(2);
  }
}
