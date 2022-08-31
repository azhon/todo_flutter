/// createTime: 2022/8/26 on 11:48
/// desc:
///
/// @author azhon
class Env {
  final String name;

  const Env._(this.name);

  static const Env dev = Env._('dev');
  static const Env test = Env._('test');
  static const Env pre = Env._('pre');
  static const Env release = Env._('release');
  static const List<Env> values = [dev, test, pre, release];

  static Env env = Env.release;

  static bool get isDev => env == Env.dev;

  static bool get isTest => env == Env.test;

  static bool get isPre => env == Env.pre;

  static bool get isRelease => env == Env.release;
}
