/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    base_event
 * 创建时间:  2021/9/29 on 16:49
 * 描述:
 *
 * @author   阿钟
 */

abstract class BaseEvent<B, S> {
  ///event transform to state
  ///[bloc] 事件的Bloc
  ///[state] 当前的状态
  Future<S> on(B bloc, S currentState);
}
