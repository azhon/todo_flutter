### 效果图
<img src="https://github.com/azhon/todo-flutter/blob/sample/img/img1.png" width="300"> <img src="https://github.com/azhon/todo-flutter/blob/sample/img/img2.png" width="300">
<img src="https://github.com/azhon/todo-flutter/blob/sample/img/img3.png" width="300"> <img src="https://github.com/azhon/todo-flutter/blob/sample/img/img4.png" width="300">
### 图片资源路径与路由路径通过[这个插件](https://github.com/Xie-Yin/FlutterPlugin)自动生成
### 目录结构
- main.dart：todo-flutter项目初始化
- lib/common/api/：网络请求
- lib/common/route/：页面路由
- lib/domain/：Bloc、网络请求相关
- lib/generated/：自动生成代码存放目录
- lib/view/：使用示例
```
./lib
├── common
│         ├── api
│         │      ├── api_convert.dart
│         │      └── api_provider.dart
│         └── route
│             └── module_route.dart
├── domain
│         ├── bloc
│         │       ├── bloc
│         │       │       ├── test_bloc.dart
│         │       │       ├── test_event.dart
│         │       │       └── test_state.dart
│         │       └── net
│         │           ├── net_bloc.dart
│         │           ├── net_event.dart
│         │           └── net_state.dart
│         └── request
│             ├── entity
│             │         ├── get_entity.dart
│             │         └── list_data_entity.dart
│             ├── list_request.dart
│             └── net_request.dart
├── generated
│            ├── assets
│            │         └── todo_flutter_assets.dart
│            ├── json
│            │       ├── base
│            │       │       ├── json_convert_content.dart
│            │       │       └── json_field.dart
│            │       ├── get_entity.g.dart
│            │       └── list_data_entity.g.dart
│            └── route
│                └── todo_flutter_route.dart
├── main.dart
└── view
    ├── bloc_page.dart
    ├── button_page.dart
    ├── image_page.dart
    ├── input_page.dart
    ├── net_page.dart
    ├── refresh_page.dart
    ├── sliver_page.dart
    ├── text_page.dart
    └── toast_page.dart
```