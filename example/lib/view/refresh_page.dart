/// createTime: 2022/7/27 on 11:50
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:todo_flutter/todo_flutter.dart';
import 'package:todo_flutter_example/domain/request/entity/list_data_entity.dart';
import 'package:todo_flutter_example/domain/request/list_request.dart';

class RefreshPage extends StatefulWidget {
  const RefreshPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RefreshPageState();
}

class _RefreshPageState extends BaseState<RefreshPage> {
  late ListBloc<ListDataEntity> _listBloc;

  @override
  void initState() {
    super.initState();
    _listBloc = ListBloc(request: ListRequest());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('下拉刷新示例')),
      body: CommonRefreshWidget<ListDataEntity>(
        bloc: _listBloc,
        child: (BuildContext context, List<ListDataEntity> list) {
          return ListView.builder(
            itemCount: list.length,
            padding: all(16),
            itemBuilder: (_, index) {
              return Card(
                child: ListTile(
                  title: CommonText(list[index].title ?? ''),
                  subtitle: Align(
                    alignment: Alignment.centerRight,
                    child: CommonText(list[index].niceDate ?? ''),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
