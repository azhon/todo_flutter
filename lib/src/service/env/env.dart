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

  static bool get isDev => env.name == Env.dev.name;

  static bool get isTest => env.name == Env.test.name;

  static bool get isPre => env.name == Env.pre.name;

  static bool get isRelease => env.name == Env.release.name;

  static Env fromEnv(String env) {
    return Env._(env);
  }
}
