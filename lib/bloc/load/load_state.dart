/// createTime: 2021/10/21 on 14:57
/// desc:
///
/// @author azhon
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

abstract class LoadState {}

class InitialState extends LoadState {}

class LoadingState extends LoadState {}

class ErrorState extends LoadState {
  final ApiException exception;

  ErrorState(this.exception);
}
