/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    data_change_state
 * 创建时间:  2021/9/30 on 10:48
 * 描述:     TODO
 *
 * @author   阿钟
 */
abstract class DataChangeState<T> {
  final T? data;

  DataChangeState(this.data);
}

class DataChangeInitialState<T> extends DataChangeState<T> {
  DataChangeInitialState(T? data) : super(data);
}
