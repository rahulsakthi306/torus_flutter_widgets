import 'package:flutter/material.dart';

class NewTab extends StatefulWidget {
  const NewTab({super.key});

  @override
  State<NewTab> createState() => _NewTabState();
}

class _NewTabState extends State<NewTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> _tabs = const [
    Tab(text: 'Tab1'),
    Tab(text: 'Tab2'),
    Tab(text: 'Tab3'),
  ];
  final Color _selectedColor = Colors.blue;
  final Color _unselectedColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: _tabs,
            labelColor: _selectedColor,
            indicatorColor: _selectedColor,
            unselectedLabelColor: _unselectedColor,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Center(child: Text('Content for Tab 1')),
                Center(child: Text('Content for Tab 2')),
                Center(child: Text('Content for Tab 3')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
