### 每一个组件的用途如下：

```text
.
├── generated
│   └── assets
│       └── todo_flutter_assets.dart （图片资源索引）
├── src
│   ├── base
│   │   ├── base_state.dart （有状态组件基类）
│   │   ├── base_stateful_widget.dart （有状态组件基类）
│   │   ├── base_stateless_widget.dart （无状态组件基类）
│   │   ├── bloc
│   │   │   ├── base_bloc.dart （Bloc基类）
│   │   │   └── base_event.dart （Bloc基类）
│   │   ├── loading_state.dart
│   │   ├── ui_adapter.dart （屏幕适配）
│   │   └── ui_widget.dart （屏幕适配代理常用组件）
│   ├── bloc
│   │   ├── data
│   │   │   ├── data_change_bloc.dart （简单Bloc）
│   │   │   └── data_change_state.dart （简单Bloc）
│   │   ├── list
│   │   │   ├── list_bloc.dart （列表Bloc）
│   │   │   ├── list_event.dart （列表Bloc）
│   │   │   └── list_state.dart （列表Bloc）
│   │   └── load
│   │       ├── load_bloc.dart （页面加载Bloc）
│   │       ├── load_event.dart （页面加载Bloc）
│   │       └── load_state.dart （页面加载Bloc）
│   ├── net
│   │   ├── base_convert.dart （数据转换器基类）
│   │   ├── base_net_engine.dart （网络请求基类）
│   │   ├── base_net_provider.dart （网络请求基类）
│   │   ├── base_request.dart （网络请求对象基类）
│   │   ├── dio_engine.dart （Dio网络请求）
│   │   └── entity
│   │       └── base_entity.dart （网络请求基类）
│   ├── service
│   │   ├── env
│   │   │   └── env.dart （App开发环境）
│   │   ├── error
│   │   │   └── domain_exception.dart （异常）
│   │   ├── event
│   │   │   └── global_event_manager.dart （全局事件发送、订阅）
│   │   ├── route
│   │   │   ├── bundle.dart （路由参数包装）
│   │   │   ├── router_history_stack.dart （路由历史栈管理）
│   │   │   ├── router_util.dart （路由工具类）
│   │   │   └── routes.dart （路由）
│   │   └── theme
│   │       └── toast_theme_data.dart （吐司主题）
│   ├── ui
│   │   ├── common_button.dart （按钮组件）
│   │   ├── common_click_widget.dart （点击事件组件）
│   │   ├── common_empty_widget.dart （空视图组件）
│   │   ├── common_error_widget.dart （错误视图组件）
│   │   ├── common_image.dart （图片组件）
│   │   ├── common_input.dart （输入框组件）
│   │   ├── common_input_area.dart （多行输入框组件）
│   │   ├── common_refresh_widget.dart （列表刷新组件）
│   │   ├── common_rich_text.dart （列表刷新组件）
│   │   ├── common_text.dart （文本组件）
│   │   ├── dialog
│   │   │   ├── base_dialog.dart （对话框基类）
│   │   │   ├── common_dialog.dart （对话框）
│   │   │   └── loading_dialog.dart （加载等待对话框）
│   │   └── widget
│   │       ├── amount_text_field_formatter.dart （金额输入框格式化）
│   │       ├── bloc_load_widget.dart （页面加载组件）
│   │       ├── circular_progress_widget.dart （加载组件）
│   │       ├── data_change_widget.dart （简单Bloc组件）
│   │       ├── extended_refresh_indicator.dart （配合ExtendedNestedScrollView刷新组件）
│   │       ├── loading_dialog_widget.dart （全局加载等待组件）
│   │       ├── remove_ripple_widget.dart （移除Android水波纹效果组件）
│   │       ├── saturation_widget.dart （饱和度组件）
│   │       └── un_focus_widget.dart （移除焦点组件）
│   └── util
│       ├── log_util.dart （日志打印工具类）
│       ├── object_util.dart （对象工具类）
│       ├── preference_util.dart （本地数据存储工具类）
│       ├── time_util.dart （时间处理工具类）
│       └── tip_util.dart （吐司工具类）
├── todo_app.dart （框架初始化）
├── todo_flutter.dart
└── todo_lib.dart （框架数据包装）
```