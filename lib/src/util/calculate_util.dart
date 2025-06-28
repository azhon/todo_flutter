import 'package:decimal/decimal.dart';

/// createTime: 2024/4/28 on 14:33
/// desc:
///
/// @author azhon
class CalculateUtil {
  ///数字转[Decimal]
  static Decimal parse(num? value) {
    return Decimal.parse(value?.toString() ?? '0');
  }

  ///字符串转[Decimal]
  static Decimal parseStr(String? value) {
    return Decimal.parse(value ?? '0');
  }

  ///加法
  static Decimal plus(num a, num b) {
    return parse(a) + parse(b);
  }

  ///减法
  static Decimal minus(num a, num b) {
    return parse(a) - parse(b);
  }

  ///乘法
  static Decimal multiply(num a, num b) {
    return parse(a) * parse(b);
  }

  ///除法
  ///[scaleOnInfinitePrecision] 保留几位小数
  static Decimal divide(
    num a,
    num b, [
    int scaleOnInfinitePrecision = 2,
  ]) {
    final result = parse(a) / parse(b);
    return result.toDecimal(scaleOnInfinitePrecision: scaleOnInfinitePrecision);
  }
}
