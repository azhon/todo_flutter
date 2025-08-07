## [使用例子/Sample](https://github.com/azhon/todo_flutter/tree/main/example)

## 基于Bloc状态管理、屏幕适配、路由管理、模块化、封装常用组件的Flutter项目脚手架
- 使用`Flutter 3.32.8`或更高版本

### 组件库介绍

[在使用前请务必先阅读一遍，以避免重复封装](https://github.com/azhon/todo_flutter/blob/main/WIDGETS.md)

### 一、依赖本库：

```dart
todo_flutter: ^latest_version
```
- 初始化

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
- 使用[FlutterResource插件](https://github.com/azhon/FlutterResource)

### 五、模块化开发
- 使用[ModuleBridge插件](https://github.com/azhon/module_bridge)

### 六、网络模块
- 实现http客户端 `BaseNetEngine`
- 实现数据转换器，生成对应实体 `BaseConvert`
- 实现网络请求 `BaseRequest`并指定提供一个`BaseNetProvider`
- json实体插件[FlutterJsonBeanFactory](https://plugins.jetbrains.com/plugin/11415-flutterjsonbeanfactory-only-null-safety-)