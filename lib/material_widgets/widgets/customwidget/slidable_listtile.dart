import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableListTileExample extends StatefulWidget {
  const SlidableListTileExample({super.key});

  @override
  _SlidableListTileExampleState createState() => _SlidableListTileExampleState();
}

class _SlidableListTileExampleState extends State<SlidableListTileExample> {
  List<Map<String, String>> items = List.generate(
    10,
    (index) => {
      'title': 'Item $index',
      'subtitle': 'Subtitle $index',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Slidable(
            key: ValueKey(item['title']),
            endActionPane: ActionPane(
              motion: const DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: ListTile(
              title: Text(item['title']!),
              subtitle: Text(item['subtitle']!),
            ),
          );
        },
      ),
    );
  }
}