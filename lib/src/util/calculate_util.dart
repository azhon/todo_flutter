import 'package:decimal/decimal.dart';

/// createTime: 2024/4/28 on 14:33
/// desc:
///
/// @author azhon
class CalculateUtil {
  ///加法
  static Decimal plus(double a, double b) {
    return Decimal.parse(a.toString()) + Decimal.parse(b.toString());
  }

  ///减法
  static Decimal minus(double a, double b) {
    return Decimal.parse(a.toString()) - Decimal.parse(b.toString());
  }

  ///乘法
  static Decimal multiply(double a, double b) {
    return Decimal.parse(a.toString()) * Decimal.parse(b.toString());
  }

  ///除法
  ///[scaleOnInfinitePrecision] 保留几位小数
  static Decimal divide(
    double a,
    double b, [
    int scaleOnInfinitePrecision = 2,
  ]) {
    final result = Decimal.parse(a.toString()) / Decimal.parse(b.toString());
    return result.toDecimal();
  }
}
