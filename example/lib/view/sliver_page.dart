/// createTime: 2022/7/28 on 11:21
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:flutter_basic_lib/flutter_basic_lib.dart';

class SliverPage extends StatefulWidget {
  const SliverPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SliverPageState();
}

class _SliverPageState extends BaseState<SliverPage>
    with TickerProviderStateMixin {
  final List<String> _tabs = ['Tab1', 'Tab2', 'Tab3', 'Tab4'];
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: setWidth(250),
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Sliver示例'),
                titlePadding: only(bottom: 16, left: 60),
                background: CommonImage(
                  network:
                      'https://cdn-usa.skypixel.com/uploads/usa_files/photo/image/367e939b-a88b-4891-983d-10edb4e72cf0.5766795@!1920',
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                tabBar: TabBar(
                  labelColor: Colors.blue,
                  controller: _controller,
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: _tabs.map((e) => Tab(text: e)).toList(),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _controller,
          children: _tabs.map((e) => _tabBody()).toList(),
        ),
      ),
    );
  }

  Widget _tabBody() {
    return ListView.separated(
      itemCount: 100,
      padding: EdgeInsets.zero,
      itemBuilder: (_, index) {
        return Container(
          color: Colors.blue[200],
          height: setWidth(50),
          child: Center(
            child: CommonText('$index'),
          ),
        );
      },
      separatorBuilder: (_, index) {
        return sizedBox(height: 8);
      },
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverTabBarDelegate({required this.tabBar});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ColoredBox(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return oldDelegate.tabBar != tabBar;
  }
}
