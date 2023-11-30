/// createTime: 2021/9/29 on 16:49
/// desc:
///
/// @author azhon

abstract class BaseEvent<B, S> {
  ///event transform to state
  ///[bloc] 事件的Bloc
  ///[currentState] 当前的状态
  Future<S?> on(B bloc, S currentState);
}
