## [使用例子/Sample](https://github.com/azhon/todo-flutter/tree/main/example)

## 框架使用详解
- 使用`Flutter 3.13.0`或更高版本

### 组件库介绍
|  组件名称   | 描述  |
|  ----  | ----  |
| CommonButton  | 按钮组件 |
| CommonImage  | 图片组件 |
| CommonInput  | 输入框组件 |
| CommonInputArea  | 带计数的输入框组件 |
| CommonRichText  | 富文本组件 |
| CommonText  | 文本组件 |
| CommonClickWidget  | 点击事件组件 |
| CommonRefreshWidget  | 列表刷新、加载组件 |
| CommonDialog  | 对话框组件 |
| SaturationWidget  | 饱和度组件 |
| LoadingDialogWidget  | 全屏对话框组件 |
| BlocLoadWidget  | 加载组件 |
| DataChangeWidget  | 简单数据状态管理组件 |
| BaseStatefulWidget</br>BaseState  | 有状态组件 |
| BaseStatelessWidget  | 无状态组件 |

### 一、框架初始化：
```dart
void main() {
  runApp(TodoApp(home: MyHomePage()));
}
```
### 二、路由模块：
- 使用[fluro](https://pub.dev/packages/fluro)
- 路由路径生成使用[FlutterResource插件](https://github.com/Xie-Yin/FlutterResource)

### 三、屏幕适配：
- 使用[flutter_screenutil](https://pub.dev/packages/flutter_screenutil)

### 四、图片资源生成
- 使用[FlutterResource插件](https://github.com/Xie-Yin/FlutterResource)

### 五、模块化开发
- 使用[ModuleBridge插件](https://github.com/azhon/module_bridge)

### 六、网络模块
- 实现http客户端 `BaseNetEngine`
- 实现数据转换器，生成对应实体 `BaseConvert`
- 实现网络请求 `BaseRequest`并指定提供一个`BaseNetProvider`
- json实体插件[FlutterJsonBeanFactory](https://plugins.jetbrains.com/plugin/11415-flutterjsonbeanfactory-only-null-safety-)