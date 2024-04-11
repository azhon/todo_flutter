/// createTime: 2021/9/27 on 17:59
/// desc:
///
/// @author azhon
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_flutter/todo_flutter.dart';
import 'package:todo_flutter_example/generated/assets/example_assets.dart';

class InputPage extends BaseStatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InputPageState();
}

class _InputPageState extends BaseState<InputPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _psdController = TextEditingController();
  final DataChangeBloc<bool> _obscureTextBloc = DataChangeBloc<bool>(true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('输入框示例')),
      body: UnFocusWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: all(16),
            child: Column(
              children: [
                const CommonInput(
                  placeholder: '自动获取焦点',
                  autofocus: true,
                ),
                sizedBox(height: 10),
                CommonInput(
                  placeholder: '金额输入框',
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    AmountTextFieldFormatter(),
                  ],
                ),
                sizedBox(height: 10),
                CommonInput(
                  placeholder: '监听输入的内容',
                  onTextChange: (text) {
                    LogUtil.d('输入框监听：$text');
                  },
                ),
                sizedBox(height: 10),
                CommonInput(
                  controller: _controller,
                  placeholder: '前后加组件',
                  textInputAction: TextInputAction.search,
                  suffixMode: OverlayVisibilityMode.editing,
                  onSubmitted: (text) {
                    LogUtil.d('点击键盘完成：$text');
                  },
                  prefix: Padding(
                    padding: symmetric(horizontal: 4),
                    child: const CommonImage(
                      asset: ExampleAssets.icSearch,
                      width: 18,
                      height: 18,
                    ),
                  ),
                  suffix: CommonClickWidget(
                    onTap: () => _controller.text = '',
                    child: const CommonImage(
                      asset: ExampleAssets.icClear,
                      width: 18,
                      height: 18,
                    ),
                  ),
                ),
                sizedBox(height: 10),
                const CommonInput(
                  placeholder: '最多输入10个字',
                  maxLength: 10,
                ),
                sizedBox(height: 10),
                CommonInput(
                  placeholder: '手机号码输入框',
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                sizedBox(height: 10),
                const CommonInput(
                  placeholder: '密码输入框，*显示',
                  maxLines: 1,
                  obscureText: true,
                  obscuringCharacter: '*',
                ),
                sizedBox(height: 10),
                DataChangeWidget<bool>(
                  bloc: _obscureTextBloc,
                  child: (_, state) {
                    return CommonInput(
                      controller: _psdController,
                      placeholder: '密码输入框',
                      maxLines: 1,
                      obscureText: state!,
                      suffix: Listener(
                        onPointerDown: (detail) =>
                            _obscureTextBloc.changeData(false),
                        onPointerUp: (de) => _obscureTextBloc.changeData(true),
                        child: const CommonImage(
                          asset: ExampleAssets.icEye,
                          width: 18,
                          height: 18,
                        ),
                      ),
                    );
                  },
                ),
                sizedBox(height: 10),
                CommonInput(
                  placeholder: '边框输入框',
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(setRadius(20)),
                    border: Border.all(
                      color: const Color(0xFFECEEF2),
                      width: setWidth(2),
                    ),
                  ),
                  padding: symmetric(vertical: 10, horizontal: 8),
                ),
                sizedBox(height: 10),
                const CommonInputArea(
                  maxLength: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _psdController.dispose();
    _obscureTextBloc.close();
  }
}
