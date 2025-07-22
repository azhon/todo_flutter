import 'package:flutter/services.dart';

/// createTime: 2023/11/29 on 13:50
/// desc: 金额输入框
/// 允许输入`,`因为在iOS设备中数字键盘根据地区来有可能是`，`或者`.`
///
/// @author azhon
class AmountTextFieldFormatter extends FilteringTextInputFormatter {
  final int digit;
  final String _decimalComma = ',';
  final String _decimalDot = '.';

  AmountTextFieldFormatter({
    this.digit = 2,
    bool allow = true,
  }) : super(RegExp('[0-9.,]'), allow: allow);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    ///替换`,`为`.`
    if (newValue.text.contains(_decimalComma)) {
      newValue = newValue.copyWith(
        text: newValue.text.replaceAll(_decimalComma, _decimalDot),
      );
    }
    final handlerValue = super.formatEditUpdate(oldValue, newValue);
    String value = handlerValue.text;
    int selectionIndex = handlerValue.selection.end;

    ///如果输入框内容为.直接将输入框赋值为0.
    if (value == _decimalDot) {
      value = '0.';
      selectionIndex++;
    }
    if (_getValueDigit(value) > digit || _pointCount(value) > 1) {
      return oldValue;
    }
    return TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }

  ///输入多个小数点的情况
  int _pointCount(String value) {
    int count = 0;
    value.split('').forEach((e) {
      if (e == _decimalDot) {
        count++;
      }
    });
    return count;
  }

  ///获取目前的小数位数
  int _getValueDigit(String value) {
    if (value.contains(_decimalDot)) {
      return value.split(_decimalDot)[1].length;
    } else {
      return -1;
    }
  }
}
