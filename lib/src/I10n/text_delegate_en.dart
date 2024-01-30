import 'package:todo_flutter/src/I10n/text_delegate.dart';

/// createTime: 2024/1/30 on 13:34
/// desc:
///
/// @author azhon
class TextDelegateEn extends TextDelegate {
  const TextDelegateEn();

  @override
  String get languageCode => 'en';

  @override
  String get dialogConfirm => 'Confirm';

  @override
  String get dialogCancel => 'Cancel';

  @override
  String get loading => 'Loading...';

  @override
  String get empty => 'Empty';

  @override
  String get pleaseTryAgain => 'Please try again';

  @override
  String get placeholder => 'Please input content';
}
