import 'package:flutter/material.dart';

class Accordionapp extends StatefulWidget {
  const Accordionapp({super.key});

  @override
  State<Accordionapp> createState() => _AccordionappState();
}

class _AccordionappState extends State<Accordionapp> {
  // Sample data for accordion
  final List<Item> _data = [
    Item(header: 'Panel 1', body: 'Content for Panel 1', isExpanded: false),
    Item(header: 'Panel 2', body: 'Content for Panel 2', isExpanded: false),
    Item(header: 'Panel 3', body: 'Content for Panel 3', isExpanded: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Accordion Example')),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _data[index].isExpanded = !isExpanded;
            });
          },
          children: _data.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item.header),
                );
              },
              body: ListTile(
                  title: Text(item.body),
                  subtitle: const Text('Tap to close'),
                  onTap: () {
                    setState(() {
                      item.isExpanded = false;
                    });
                  }),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Item {
  String header;
  String body;
  bool isExpanded;

  Item({required this.header, required this.body, this.isExpanded = false});
}