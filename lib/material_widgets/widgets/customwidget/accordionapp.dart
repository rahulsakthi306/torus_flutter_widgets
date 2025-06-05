import 'package:flutter/material.dart';

class AccordionApp extends StatefulWidget {
  const AccordionApp({super.key});

  @override
  State<AccordionApp> createState() => _AccordionAppState();
}

class _AccordionAppState extends State<AccordionApp> {
  List<Item> _data = List.generate(
    1,
    (index) => Item(header: 'Panel ${index + 1}', body: 'Content for Panel ${index + 1}'),
  );

  void _toggleExpansion(int index) {
    setState(() {
      _data = _data.asMap().entries.map((entry) {
        final i = entry.key;
        final item = entry.value;
        return item.copyWith(isExpanded: i == index ? !item.isExpanded : false);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accordion Example')),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            _toggleExpansion(index);
          },
          children: _data.map<ExpansionPanel>((item) => _buildExpansionPanel(item)).toList(),
        ),
      ),
    );
  }

  ExpansionPanel _buildExpansionPanel(Item item) {
    return 
    ExpansionPanel(
      headerBuilder: (context, isExpanded) => ListTile(
        title: Text(item.header),
      ),
      body: ListTile(
        title: Text(item.body),
      
        onTap: () {
          final index = _data.indexOf(item);
          _toggleExpansion(index);
        },
      ),
      isExpanded: item.isExpanded,
    );
  }
}

// Model class for each panel item
class Item {
  final String header;
  final String body;
  final bool isExpanded;

  Item({
    required this.header,
    required this.body,
    this.isExpanded = false,
  });

  Item copyWith({
    String? header,
    String? body,
    bool? isExpanded,
  }) {
    return Item(
      header: header ?? this.header,
      body: body ?? this.body,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}