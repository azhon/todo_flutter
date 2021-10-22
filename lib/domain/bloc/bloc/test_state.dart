/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    test_state
 * 创建时间:  2021/9/29 on 17:13
 * 描述:     TODO
 *
 * @author   阿钟
 */
abstract class TestState {
  final String? data;

  TestState(this.data);
}

class TestInitialState extends TestState {
  TestInitialState(String? data) : super(data);
}
