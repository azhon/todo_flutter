/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    net_state
 * 创建时间:  2021/10/15 on 11:55
 * 描述:     
 *
 * @author   阿钟
 */
import 'package:todo_flutter/domain/bean/get_bean.dart';

abstract class NetState {
  final GetBean? data;

  NetState(this.data);
}

class NetInitialState extends NetState {
  NetInitialState(GetBean? data) : super(data);
}
