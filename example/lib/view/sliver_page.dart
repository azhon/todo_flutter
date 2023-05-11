/// createTime: 2022/7/28 on 11:21
/// desc:
///
/// @author azhon

import 'dart:math';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter/todo_flutter.dart';
import 'package:todo_flutter_example/generated/assets/example_assets.dart';

class SliverPage extends StatefulWidget {
  const SliverPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SliverPageState();
}

class _SliverPageState extends BaseState<SliverPage>
    with TickerProviderStateMixin {
  final List<String> _tabs = ['Tab1', 'Tab2', 'Tab3', 'Tab4'];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sliver示例')),

      ///pull refresh
      body: ExtendedRefreshIndicator(
        notificationPredicate: (notification) {
          return true;
        },
        onRefresh: () {
          final second = Random().nextInt(2) + 1;
          return Future<bool>.delayed(Duration(seconds: second), () {
            return true;
          });
        },
        child: ExtendedNestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return _createSlivers();
          },
          body: Column(
            children: [
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: _tabs.map((e) {
                  return Tab(text: e);
                }).toList(),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: _tabs
                      .map(
                        (e) => BodyWidget(
                          tab: e,
                          key: PageStorageKey(e),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 是否需要刷新
  List<Widget> _createSlivers() {
    return [
      SliverToBoxAdapter(
        child: Column(
          children: [
            Container(height: 50, color: Colors.amber),
            Padding(
              padding: symmetric(vertical: 16),
              child: const CommonText(
                '头部可以放任意组件',
                fontSize: 16,
              ),
            ),
            Container(height: 50, color: Colors.blue),
            const CommonImage(
              asset: ExampleAssets.icPolice,
              width: 150,
              height: 150,
            ),
            Container(height: 50, color: Colors.orange),
            Padding(
              padding: symmetric(vertical: 16),
              child: const CommonText(
                '底部Tab带状态保存',
                fontSize: 16,
              ),
            ),
            Container(height: 50, color: Colors.indigoAccent),
          ],
        ),
      ),
    ];
  }
}

class BodyWidget extends BaseStatelessWidget {
  final String tab;

  const BodyWidget({required this.tab, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 100,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (_, index) {
        return Container(
          height: setWidth(50),
          color: Colors.blue[200],
          child: Center(child: Text('$tab -- $index')),
        );
      },
      separatorBuilder: (_, index) {
        return sizedBox(height: 8);
      },
    );
  }
}
