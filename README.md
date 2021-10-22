### 项目介绍
### 框架初始化：
```java
return TodoLib(
  //自定义数据
  //data: TodoLibData(),
  child: MaterialApp(
    //....
    home: MyHomePage(),
  ),
);
```
#### 一、路由模块：
- 初始化路由

```java
return MaterialApp(
  //....
  navigatorKey: TodoLib.navigatorKey,
  onGenerateRoute: RouterUtil.instance.generator(),
 );
```
- 添加路由至路由表，路由名称通过`route.sh`脚本自动扫描文件生成

```java
RouterUtil.instance.addRoute(ModuleRouteName.ButtonPage,
    (Map<String, dynamic> map, dynamic obj) {
  return ButtonPage();
});
```
#### 二、屏幕适配：
- https://pub.dev/packages/flutter_screenutil
- 设置字体不随系统字体大小进行改变

```java
return ScreenUtilInit(
  designSize: Size(750, 1334),
  builder: () => MaterialApp(
    //...
    builder: (BuildContext context, Widget? widget) {
      //设置字体不随系统字体大小进行改变
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: widget ?? Container(),
      );
    },
  ),
);
```
### 三、网络模块
- 实现http客户端 `BaseNetEngine`
- 实现数据转换器，生成对应实体 `BaseConvert`
- 实现网络请求 `BaseRequest`并指定提供一个`BaseNetProvider`
- json实体插件[JsonToDart (JSON To Dart)](https://plugins.jetbrains.com/plugin/12562-jsontodart-json-to-dart-)