/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    load_state
 * 创建时间:  2021/10/21 on 14:57
 * 描述:     
 *
 * @author   阿钟
 */
import 'package:flutter_basic_lib/error/api_exception.dart';

abstract class LoadState {}

class InitialState extends LoadState {}

class LoadingState extends LoadState {}

class ErrorState extends LoadState {
  final ApiException exception;

  ErrorState(this.exception);
}
