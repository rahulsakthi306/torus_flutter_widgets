import 'package:flutter/material.dart';

class CommonTabBar extends StatefulWidget {
  final List<TabItem> tabs;

  const CommonTabBar({super.key, required this.tabs});

  @override
  State<CommonTabBar> createState() => _CommonTabBarState();
}

class _CommonTabBarState extends State<CommonTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<TabItem>  tabs = [
      TabItem(title: 'Tab 1', content: Center(child: Text('hellow'),), ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: tabs.map((tab) => Tab(text: tab.title)).toList(),
          indicatorColor: Theme.of(context).colorScheme.primary,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          dividerHeight: 0
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: tabs.map((tab) => tab.content).toList(),
          ),
        ),
      ],
    );
  }
}

class TabItem {
  final String title;
  final Widget content;

  TabItem({required this.title, required this.content});
}